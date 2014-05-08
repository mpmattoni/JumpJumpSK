//
//  MyScene.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 4/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene{
    
    
    SKSpriteNode *frog;
    SKSpriteNode *snake;
    SKSpriteNode *myBackground;
    SKSpriteNode *redSnake;
    NSArray *frogAnimation;
    NSArray *snakeAnimation;
    NSArray *redSnakeAnimationFramesRight;
    NSArray *redSnakeAnimationFramesLeft;
    SKAction *frogAction;
    SKAction *snakeAction;
    SKAction *redSnakeAnimateRight;
    SKAction *redSnakeAnimateLeft;
    SKAction *redSnakeMoveRight;
    SKAction *redSnakeMoveLeft;
    SKAction *redSnakeMoveWait;
    SKAction *redSnakeActionsRight;
    SKAction *redSnakeActionsLeft;
    SKAction *redSnakeActionComplete;

    
    
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [self createBackground];
        [self createPhysicsWorld];
        [self addAllSprites];
        [self createAllAnimations];
    }
    return self;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
        SKAction *frogJump = [SKAction moveToY:frog.position.y+50 duration:0.1];
        [frog runAction:frogJump];
        
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    

    
}

-(void)createBackground{
    myBackground = [SKSpriteNode spriteNodeWithImageNamed:@"jungle_background_640x960"];
    myBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    myBackground.name = @"Background";
    [self addChild:myBackground];
}

-(void)createPhysicsWorld{
    //self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    //self.physicsWorld.gravity = CGVectorMake(0, -9.8);
    //myFrog.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:50];
    //mySnake.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:100];
}

-(void)addAllSprites{
    //frog
    frog = [SKSpriteNode spriteNodeWithImageNamed:@"frog"];
    frog.position = CGPointMake(0,-125);
    [myBackground addChild:frog];
    
    //snake
    snake = [SKSpriteNode spriteNodeWithImageNamed:@"snake1"];
    snake.position = CGPointMake(-200,-100);
    [myBackground addChild:snake];

    //redSnake
    redSnake = [SKSpriteNode spriteNodeWithImageNamed:@"redsnake-right-1"];
    redSnake.position = CGPointMake(-400,-100);
    [myBackground addChild:redSnake];


}

-(void)createAllAnimations{
    
    //frog
    frogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
    frogAction = [SKAction animateWithTextures:frogAnimation timePerFrame:1.0];
    [frog runAction:[SKAction repeatActionForever:frogAction]];
    
    //snake
    snakeAnimation = @[[SKTexture textureWithImageNamed:@"snake1"],
                         [SKTexture textureWithImageNamed:@"snake2"],
                         [SKTexture textureWithImageNamed:@"snake3"],
                         [SKTexture textureWithImageNamed:@"snake4"],
                         [SKTexture textureWithImageNamed:@"snake5"],
                         [SKTexture textureWithImageNamed:@"snake6"],
                         [SKTexture textureWithImageNamed:@"snake7"],
                         [SKTexture textureWithImageNamed:@"snake8"],
                         [SKTexture textureWithImageNamed:@"snake9"],
                         [SKTexture textureWithImageNamed:@"snake10"],
                         [SKTexture textureWithImageNamed:@"snake11"],
                         [SKTexture textureWithImageNamed:@"snake12"],
                         [SKTexture textureWithImageNamed:@"snake13"],
                         [SKTexture textureWithImageNamed:@"snake14"],
                         [SKTexture textureWithImageNamed:@"snake15"],
                         [SKTexture textureWithImageNamed:@"snake16"]
                         ];
    snakeAction = [SKAction animateWithTextures:snakeAnimation timePerFrame:1.0];
    [snake runAction:[SKAction repeatActionForever:snakeAction]];
    
    //redsnake
    redSnakeAnimationFramesRight = @[[SKTexture textureWithImageNamed:@"redsnake-right-1"],
                               [SKTexture textureWithImageNamed:@"redsnake-right-2"],
                               [SKTexture textureWithImageNamed:@"redsnake-right-3"],
                               [SKTexture textureWithImageNamed:@"redsnake-right-4"],
                               [SKTexture textureWithImageNamed:@"redsnake-right-5"],
                               [SKTexture textureWithImageNamed:@"redsnake-right-6"]];
    redSnakeAnimationFramesLeft = @[[SKTexture textureWithImageNamed:@"redsnake-left-1"],
                              [SKTexture textureWithImageNamed:@"redsnake-left-2"],
                              [SKTexture textureWithImageNamed:@"redsnake-left-3"],
                              [SKTexture textureWithImageNamed:@"redsnake-left-4"],
                              [SKTexture textureWithImageNamed:@"redsnake-left-5"],
                              [SKTexture textureWithImageNamed:@"redsnake-left-6"]];
    redSnakeAnimateRight = [SKAction animateWithTextures:redSnakeAnimationFramesRight timePerFrame:1.0];
    redSnakeMoveWait = [SKAction waitForDuration: 0.5];
    redSnakeAnimateLeft = [SKAction animateWithTextures:redSnakeAnimationFramesLeft timePerFrame:1.0];
    redSnakeMoveRight = [SKAction moveByX:800 y:0 duration:3.0];
    redSnakeMoveLeft = [SKAction moveByX:-800 y:0 duration:3.0];
    
    //create group to run animations and moves in parallel to right
    redSnakeActionsRight = [SKAction group:@[redSnakeAnimateRight, redSnakeMoveRight]];
    redSnakeActionsLeft = [SKAction group:@[redSnakeAnimateLeft, redSnakeMoveLeft]];
   
    //create a group to run right, then left moves and animations
    redSnakeActionComplete =[SKAction sequence:@[redSnakeActionsRight, redSnakeActionsLeft]];
                                       
    [redSnake runAction:[SKAction repeatActionForever:redSnakeActionComplete]];

}

@end
