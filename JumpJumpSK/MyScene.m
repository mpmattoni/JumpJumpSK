//
//  MyScene.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 4/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "MyScene.h"
#import "Frog.h"
#import "RedSnake.h"
#import "GreenSnake.h"
#import "Fly.h"

#define Z_ORDER_FOREGROUND 100
#define Z_ORDER_BACKGROUND -100
#define Z_ORDER_FRONT 50
#define Z_ORDER_MIDDLE 30
#define Z_ORDER_BACK 10



@interface MyScene ()
{}
@property (nonatomic,strong) Frog *myFrog;
@property (nonatomic,strong) Fly *myFly;
@property (nonatomic,strong) RedSnake *redSnake;
@property (nonatomic,strong) GreenSnake *greenSnake;

@end


@implementation MyScene{
    SKSpriteNode *myBackground;
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [self createBackground];
        [self createPhysicsWorld];
        [self addAllSprites];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [self.myFrog jump];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)createBackground{
    myBackground = [SKSpriteNode spriteNodeWithImageNamed:@"jungle_background_640x960"];
    myBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    myBackground.name = @"Background";
    myBackground.zPosition = Z_ORDER_BACKGROUND;
    [self addChild:myBackground];
}

-(void)createPhysicsWorld{
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);

   }



-(void)addAllSprites{
    //frog
    self.myFrog = [Frog getInstance];
    [self.myFrog lookAround];
    self.myFrog.position = CGPointMake(0,0);
    self.myFrog.zPosition = Z_ORDER_FOREGROUND;
    [myBackground addChild:self.myFrog];
    
    //snake
    self.greenSnake = [GreenSnake getInstance];
    [self.greenSnake animate];
    self.greenSnake.position = CGPointMake(-200,-100);
    self.greenSnake.zPosition = Z_ORDER_MIDDLE;
    [myBackground addChild:self.greenSnake];
    
    //redSnake
    self.redSnake = [RedSnake getInstance];
    [self.redSnake animate];
    self.redSnake.position = CGPointMake(-400,-100);
    self.redSnake.zPosition = Z_ORDER_BACK;
    [myBackground addChild:self.redSnake];
    
    //fly
    self.myFly = [Fly getInstance];
    [self.myFly flyAcrossScreen];
    self.myFly.position = CGPointMake(-200,-100);
    self.myFly.zPosition = Z_ORDER_FOREGROUND+1;
    [myBackground addChild:self.myFly];
    
    SKShapeNode *myLine = [SKShapeNode node];
    myLine.path = [self.myFly pathAcrossScreen];
    [myLine setStrokeColor:[UIColor yellowColor]];
    [self addChild:myLine];
}
@end
