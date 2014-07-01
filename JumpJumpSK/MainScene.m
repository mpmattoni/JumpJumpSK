//
//  MainScene.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 4/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "MainScene.h"
#import "Frog.h"
#import "RedSnake.h"
#import "GreenSnake.h"
#import "Fly.h"
#import "Constants.h"
#import "ScoreCounter.h"
#import "LevelCounter.h"
#import "TimeCounter.h"

#define Z_ORDER_FOREGROUND 100
#define Z_ORDER_BACKGROUND -100
#define Z_ORDER_FRONT 50
#define Z_ORDER_MIDDLE 30
#define Z_ORDER_BACK 10

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/* ------------------------------------------------------------*/
#pragma mark - Private interface
/* ------------------------------------------------------------*/
@interface MainScene () <SKPhysicsContactDelegate>
{}
@property (nonatomic,strong) Frog *myFrog;
@property (nonatomic,strong) RedSnake *redSnake;
@property (nonatomic,strong) GreenSnake *greenSnake;
@property (nonatomic, assign) CFTimeInterval timeSinceLastChecked;
@property (nonatomic, strong) ScoreCounter *myScoreCounter;
@property (nonatomic, strong) ScoreCounter *myScoreLabel;
@property (nonatomic, strong) LevelCounter *myLevelCounter;
@property (nonatomic, strong) LevelCounter *myLevelLabel;
@property (nonatomic, strong) TimeCounter *myTimerLabel;


@end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/* ------------------------------------------------------------*/
#pragma mark - Implementation
/* ------------------------------------------------------------*/
@implementation MainScene{
    SKSpriteNode *myBackground;
}

/* ------------------------------------------------------------*/
#pragma mark - Setup
/* ------------------------------------------------------------*/
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.name = @"Main Scene";
        [self createBackground];
        [self createPhysicsWorld];
        [self addAllSprites];
    }
    return self;
}


//TODO: Add Timer

-(void)createBackground{
    myBackground = [SKSpriteNode spriteNodeWithImageNamed:@"jungle_background_640x960"];
    myBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    myBackground.name = @"Background";
    myBackground.zPosition = Z_ORDER_BACKGROUND;
    [self addChild:myBackground];
}

-(void)addAllSprites{
    //frog
    self.myFrog = [Frog getInstance];
    [self addChild:self.myFrog];
    [self.myFrog setPositionToXPercent:50 andYPercent:10];
    [self.myFrog lookAround];
    
    //greenSnake
    self.greenSnake = [GreenSnake getInstance];
    [self addChild:self.greenSnake];
    [self.greenSnake setPositionToXPercent:0 andYPercent:0];
    [self.greenSnake bobAndHiss];
    
    //redSnake
    self.redSnake = [RedSnake getInstance];
    [self addChild:self.redSnake];
    [self.redSnake setPositionToXPercent:-20 andYPercent:15 preventClipping:NO];
    [self.redSnake slitherBackAndForth];
    
    //score label
    self.myScoreLabel = [ScoreCounter getInstance];
    [self addChild:self.myScoreLabel];
    [self.myScoreLabel setPosition: CGPointMake(CGRectGetMinX(self.frame) + 50, CGRectGetMidY(self.frame)+125)];
    self.myScoreLabel.text = @"score";
    self.myScoreLabel.fontSize = 24;
    self.myScoreLabel.zPosition = Z_POSITION_LABELS;
    
    //score counter
    self.myScoreCounter = [ScoreCounter getInstance];
    [self addChild:self.myScoreCounter];
    [self.myScoreCounter setPosition: CGPointMake(CGRectGetMinX(self.frame) + 50, CGRectGetMidY(self.frame)+100)];
    self.myScoreCounter.text = @"00";
    self.myScoreCounter.fontSize = 24;
    self.myScoreCounter.zPosition = Z_POSITION_LABELS;
    
    //level label
    self.myLevelLabel = [LevelCounter getInstance];
    [self addChild:self.myLevelLabel];
    [self.myLevelLabel setPosition: CGPointMake(CGRectGetMaxX(self.frame) - 50, CGRectGetMaxY(self.frame)-35)];
    self.myLevelLabel.text = @"level";
    self.myLevelLabel.fontSize = 24;
    self.myLevelLabel.zPosition = Z_POSITION_LABELS;
    
    //level counter
    self.myLevelCounter = [LevelCounter getInstance];
    [self addChild:self.myLevelCounter];
    [self.myLevelCounter setPosition: CGPointMake(CGRectGetMaxX(self.frame) -50, CGRectGetMaxY(self.frame)-60)];
    self.myLevelCounter.text = @"1";
    self.myLevelCounter.fontSize = 24;
    self.myLevelCounter.zPosition = Z_POSITION_LABELS;
    
    //timer
    self.myTimerLabel = [TimeCounter getInstance];
    [self addChild:self.myTimerLabel];
    [self.myTimerLabel setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+100)];
    self.myTimerLabel.text = @"30";
    self.myTimerLabel.fontColor = [UIColor greenColor];
    self.myTimerLabel.fontSize = 36;
    self.myTimerLabel.zPosition = Z_POSITION_LABELS;
    [self.myTimerLabel initializeTimerwithSeconds:30];
    [self.myTimerLabel startTimer];
    
}

- (void) generateNewFly {
    NSLog(@"GENERATING FLY");
    Fly *fly = [Fly getInstance];
    [self addChild:fly];
    [fly flyAcrossScreen];
}

- (int) getCurrentFlyCount {
    int count = 0;
    for (id node in [self children]){
        if ([node isKindOfClass:[Fly class]]){
            count++;
        }
    }
    NSLog(@"Current fly count: %d", count);
    return count;
}


/* ------------------------------------------------------------*/
#pragma mark - Interaction
/* ------------------------------------------------------------*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
        [self.myFrog jump];
    
}

-(void)update:(CFTimeInterval)currentTime {
    //every 2 seconds, check fly count
    
    if ((currentTime - self.timeSinceLastChecked) > 2){
        self.timeSinceLastChecked = currentTime;
        if ([self getCurrentFlyCount] < 10){
            [self generateNewFly];
        }
    }
}

-(void)frogEatsFly:(Fly *) myFly atPoint:(CGPoint)contactPoint{
        NSString *sparkPath =
    [[NSBundle mainBundle]
     pathForResource:@"SparkEmitter" ofType:@"sks"];
    
    SKEmitterNode *SparkEmitterNode =
    [NSKeyedUnarchiver unarchiveObjectWithFile:sparkPath];
    
    SparkEmitterNode.position = contactPoint;
    SparkEmitterNode.numParticlesToEmit = 50;
    
    [self.myScoreCounter incrementScoreBy:1];

    [myFly removeFromParent];
    [self addChild:SparkEmitterNode];
}

/* ------------------------------------------------------------*/
#pragma mark - Physics
/* ------------------------------------------------------------*/
-(void)createPhysicsWorld{
#if PHYSICS
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    self.physicsWorld.contactDelegate = self;
#endif
}

- (void) didBeginContact:(SKPhysicsContact *)contact
{
    SKNode *nodeA = contact.bodyA.node;
    if([nodeA isKindOfClass:[Frog class]]) {
        SKNode *nodeB = contact.bodyB.node;
        if([nodeB isKindOfClass:[Fly class]]){
            CGPoint contactPoint = contact.contactPoint;
            
            [self frogEatsFly:(Fly*)nodeB atPoint:contactPoint];
        }
    }
    
    
}

@end
