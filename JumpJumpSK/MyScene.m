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
        
        SKSpriteNode *myBackground = [SKSpriteNode spriteNodeWithImageNamed:@"jungle-dawn1"];
        myBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        myBackground.name = @"Background";
        
        
        myFrog = [SKSpriteNode spriteNodeWithImageNamed:@"frog"];
        myFrog.position = CGPointMake(25, 25);

        
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
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    

    
}

@end
