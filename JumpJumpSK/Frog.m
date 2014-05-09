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
        //do stuff
    }
    return self;
}

- (void) animate {
    NSArray *frogAnimation = @[[SKTexture textureWithImageNamed:@"frogleft"], [SKTexture textureWithImageNamed:@"frogright"], [SKTexture textureWithImageNamed:@"frogsmile"]];
    SKAction *frogAction = [SKAction animateWithTextures:frogAnimation timePerFrame:1.0];
    [self runAction:[SKAction repeatActionForever:frogAction]];
}

@end
