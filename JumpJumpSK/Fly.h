//
//  Fly.h
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Fly: SKSpriteNode

+ (Fly *) getInstance;

- (void) animate;

@end