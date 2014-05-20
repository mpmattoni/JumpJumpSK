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
@property (nonatomic,strong) Fly *myFly;
@property (nonatomic,strong) RedSnake *redSnake;
@property (nonatomic,strong) GreenSnake *greenSnake;

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
    [myBackground addChild:self.myFrog];
    [self.myFrog setPositionToXPercent:50 andYPercent:100];
    [self.myFrog lookAround];
    
    //greenSnake
    self.greenSnake = [GreenSnake getInstance];
    [myBackground addChild:self.greenSnake];
    [self.greenSnake setPositionToXPercent:10 andYPercent:80];
    [self.greenSnake bobAndHiss];
    
    //redSnake
    self.redSnake = [RedSnake getInstance];
    [myBackground addChild:self.redSnake];
    [self.redSnake setPositionToXPercent:-20 andYPercent:80 preventClipping:NO];
    [self.redSnake slitherBackAndForth];
    
    //fly
    self.myFly = [Fly getInstance];
    [myBackground addChild:self.myFly];
    [self.myFly flyAcrossScreen];
    
    SKShapeNode *myLine = [SKShapeNode node];
    myLine.path = [self.myFly pathAcrossScreen];
    [myLine setStrokeColor:[UIColor yellowColor]];
    [self addChild:myLine];
    myLine.position = CGPointMake(250,150);
}


/* ------------------------------------------------------------*/
#pragma mark - Interaction
/* ------------------------------------------------------------*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [self.myFrog jump];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

/* ------------------------------------------------------------*/
#pragma mark - Physics
/* ------------------------------------------------------------*/
-(void)createPhysicsWorld{
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    self.physicsWorld.contactDelegate = self;
}

- (void) didBeginContact:(SKPhysicsContact *)contact
{
    SKNode *node = contact.bodyA.node;
    if([node isKindOfClass:[Frog class]]) {
        NSLog((@"Boom"));
    }
    
    
}

@end
