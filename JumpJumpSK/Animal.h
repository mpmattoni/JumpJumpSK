//
//  Animal.h
//  JumpJumpSK
//
//  Created by Greg Duda on 5/17/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Constants.h"

@interface Animal : SKSpriteNode

- (id) initWithImageNamed:(NSString *)imageName andPosition:(CGPoint)position andZPosition:(int)zPosition;

- (void) setupPhysics;

@end
