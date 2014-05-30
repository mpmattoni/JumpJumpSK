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
        //self.timeSinceLastChecked = 0;
    }
    return self;
}

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
        NSLog(@"CHILD NODE IS: %@", [node class]);
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
    //if (!self.timeSinceLastChecked) self.timeSinceLastChecked = currentTime;
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
