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

/**
 Sets the point in the scene as determined by a grid system of X and Y. Note: Can only call this AFTER adding the sprite to the scene.
 
 For example, entering "1/5" and "1/5" would give us a point 1/5 of the way across and 1/5 of the way down.
 
 X value is if we assumed the width of the screen was broken
 up into a grid of -n- segments and we wanted the value at segment -x-.
 For example:
 
 |---|---|---|---|---|
 0   1   2   3   4   5
 
 ...if we enter "1/5", we will get the value for point 1 shown above.
 ...if we enter "0/n", we get back 0; if we enter "n/n", we get back the width of the screen
 
 Y value is if we assumed the height of the screen was broken
 up into a grid of -n- segments and we wanted the value at segment -y-.
 For example:
 
 --- 0
 |
 --- 1
 |
 --- 2
 |
 --- 3
 |
 --- 4
 |
 --- 5
 
 ...if we enter "1/5", we will get the value for point 1 shown above.
 ...if we enter "0/n", we get back 0; if we enter "n/n", we get back the width of the screen
 
 If preventClipping = YES, then alter coordinates to ensure the sprite is completely on the screen
 */
- (void) setPositionToX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal preventClipping:(BOOL)preventClipping;

/** convenience method for setPositionToX:... with preventClipping=YES */
- (void) setPositionToX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal;

- (CGPoint) getPositionForX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal preventClipping:(BOOL)preventClipping;

- (CGPoint) getPositionForX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal;

@end
