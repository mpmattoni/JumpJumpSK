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
    NSArray *myFrogAnimation;
    SKAction *myFrogAction;
    
    
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *myBackground = [SKSpriteNode spriteNodeWithImageNamed:@"jungle_background_640x960"];
        myBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        myBackground.name = @"Background";
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];

        
        
        
        myFrog = [SKSpriteNode spriteNodeWithImageNamed:@"frog"];
        myFrog.position = CGPointMake(0,0);
        myFrog.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:50];


        
        myFrogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
        
        myFrogAction = [SKAction animateWithTextures:myFrogAnimation timePerFrame:1.0];
                [self addChild:myBackground];
        
    
        
        [myFrog runAction:[SKAction repeatActionForever:myFrogAction]];
        [myBackground addChild:myFrog];
        
        
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

@end
