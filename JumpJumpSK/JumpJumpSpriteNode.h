//
//  JumpJumpSpriteNode.h
//  JumpJumpSK
//
//  Created by Greg Duda on 5/17/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Constants.h"
#import "MainScene.h"

@interface JumpJumpSpriteNode : SKSpriteNode

- (id) initWithImageNamed:(NSString *)imageName andZPosition:(int)zPosition;

- (void) setupPhysics;

/*
 The following "Percent" methods position the sprite in the scene using a percentage of total width/height. For example, if you provide "20" as a parameter,
 then the sprite is placed 20% of the way along the provided axis (x or y).
 
 Values can be used to place the item off the visibile area (e.g. "120").
 If preventClipping = YES, then coordinates are altered to ensure the sprite is completely on the screen
 
 Note: Can only call this AFTER adding the sprite to the scene.
 */
- (void) setPositionToXPercent:(int)x andYPercent:(int)y preventClipping:(BOOL)preventClipping;
- (void) setPositionToXPercent:(int)x andYPercent:(int)y;
- (CGPoint) getPositionForXPercent:(int)x andYPercent:(int)y preventClipping:(BOOL)preventClipping;
- (CGPoint) getPositionForXPercent:(int)x andYPercent:(int)y;

@end
