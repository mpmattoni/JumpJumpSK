//
//  Frog.m
//  JumpJumpSK
//
//  Created by Greg Duda on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "Frog.h"

#define FROG_IMAGE @"frog"

@implementation Frog

    bool blJumping;

+ (Frog *) getInstance {
    return [[Frog alloc] initWithImageNamed:FROG_IMAGE andZPosition:Z_POSITION_FROG];
}

- (void) setupPhysics {
#if PHYSICS
    [super setupPhysics];
    self.physicsBody.categoryBitMask = FrogCollider;
    self.physicsBody.collisionBitMask = NoCollision;
    self.physicsBody.contactTestBitMask = FlyCollider;
#endif
}

- (void) lookAround {
   [self removeAllActions];
    [self runAction:[SKAction repeatActionForever:[self getLookAroundAction]]];
}

- (void) jump {
    //TODO:  Change the frog's physics body as he animates so that he collides correctly
    if(!blJumping){
        blJumping = true;
        [self removeAllActions];
        [self runAction:[self getJumpUpAction] completion:^{
            blJumping = false;
            [self lookAround];
        }];
    }
}

- (SKAction *) getLookAroundAction {
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
    return [SKAction animateWithTextures:frogAnimation timePerFrame:1.0];
}

- (SKAction *) getJumpUpAction {
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frog-model"], [SKTexture textureWithImageNamed:@"frog-model2"]];
    SKAction *frogAction = [SKAction animateWithTextures:frogAnimation timePerFrame:0.1];
    SKAction *frogMoveUp = [SKAction moveByX:0 y:600 duration:0.75];
    return [SKAction group:@[frogAction, frogMoveUp]];
}

@end
