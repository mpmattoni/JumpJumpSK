//
//  Frog.h
//  JumpJumpSK
//
//  Created by Greg Duda on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Frog : SKSpriteNode

+ (Frog *) getInstance;

- (void) animate;

@end
