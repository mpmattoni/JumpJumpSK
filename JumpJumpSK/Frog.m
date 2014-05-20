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

+ (Frog *) getInstance {
    return [[Frog alloc] initWithImageNamed:FROG_IMAGE andZPosition:Z_POSITION_FROG];
}

- (void) setupPhysics {
    [super setupPhysics];
    self.physicsBody.categoryBitMask = FrogCollider;
    self.physicsBody.collisionBitMask = FlyCollider;
    self.physicsBody.usesPreciseCollisionDetection = YES;
    self.physicsBody.mass = 500;
    
}

- (void) lookAround {
   [self removeAllActions];
    [self runAction:[SKAction repeatActionForever:[self getLookAroundAction]]];
}

- (void) jump {
   [self removeAllActions];
    [self runAction:[self getJumpUpAction] completion:^{
        [self lookAround];
    }];
}

- (SKAction *) getLookAroundAction {
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
    return [SKAction animateWithTextures:frogAnimation timePerFrame:1.0];
}

- (SKAction *) getJumpUpAction {
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frog-model"], [SKTexture textureWithImageNamed:@"frog-model2"]];
    SKAction *frogAction = [SKAction animateWithTextures:frogAnimation timePerFrame:0.1];
    SKAction *frogMoveUp = [SKAction moveByX:0 y:300 duration:0.5];
    return [SKAction group:@[frogAction, frogMoveUp]];
}

@end
