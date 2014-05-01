//
//  MyScene.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 4/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene{
    
    
    SKSpriteNode *myFrog;
    SKSpriteNode *mySnake;
    SKSpriteNode *myBackground;
    NSArray *myFrogAnimation;
    NSArray *mySnakeAnimation;
    SKAction *myFrogAction;
    SKAction *mySnakeAction;
    
    
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
    
        SKAction *frogJump = [SKAction moveToY:myFrog.position.y+50 duration:0.1];
        [myFrog runAction:frogJump];
        
    
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
    myFrog = [SKSpriteNode spriteNodeWithImageNamed:@"frog"];
    myFrog.position = CGPointMake(0,-125);
    [myBackground addChild:myFrog];
    
    //snake
    mySnake = [SKSpriteNode spriteNodeWithImageNamed:@"snake1"];
    mySnake.position = CGPointMake(-200,-100);
    [myBackground addChild:mySnake];


}

-(void)createAllAnimations{
    
    //frog
    myFrogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
    myFrogAction = [SKAction animateWithTextures:myFrogAnimation timePerFrame:1.0];
    [myFrog runAction:[SKAction repeatActionForever:myFrogAction]];
    
    //snake
    mySnakeAnimation = @[[SKTexture textureWithImageNamed:@"snake1"],
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
    mySnakeAction = [SKAction animateWithTextures:mySnakeAnimation timePerFrame:1.0];
    [mySnake runAction:[SKAction repeatActionForever:mySnakeAction]];
}

@end
