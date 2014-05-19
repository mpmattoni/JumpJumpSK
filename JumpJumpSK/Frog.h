//
//  Frog.h
//  JumpJumpSK
//
//  Created by Greg Duda on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "JumpJumpSpriteNode.h"

@interface Frog : JumpJumpSpriteNode

+ (Frog *) getInstance;

- (void) lookAround;
- (void) jump;

@end
