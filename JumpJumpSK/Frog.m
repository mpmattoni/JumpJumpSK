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
    return [[Frog alloc] initWithImageNamed:FROG_IMAGE];
}

- (id) initWithImageNamed:(NSString *)name
{
    if (self = [super initWithImageNamed:name]){
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.frame.size.height];
    }
    return self;
}

- (void) lookAround {
    [self removeAllActions];
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
    SKAction *frogAction = [SKAction animateWithTextures:frogAnimation timePerFrame:1.0];
    [self runAction:[SKAction repeatActionForever:frogAction]];
}

- (void) jump {
    [self removeAllActions];
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frogrest"], [SKTexture textureWithImageNamed:@"frog-model2"], [SKTexture textureWithImageNamed:@"frog-model"]];
    SKAction *frogAction = [SKAction animateWithTextures:frogAnimation timePerFrame:0.1];
    SKAction *frogMoveUp = [SKAction moveByX:0 y:300 duration:0.5];
    SKAction *frogJump = [SKAction group:@[frogAction, frogMoveUp]];
    [self runAction:frogJump];
}

@end
