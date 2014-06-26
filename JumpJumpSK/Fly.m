
//
//  Fly.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "Fly.h"
#import "Utils.h"
#include <stdlib.h>

#define FLY_IMAGE @"fly"

@implementation Fly

//TODO: Make Flies more random (some fast, different pattern)
+ (Fly *) getInstance {
    return [[Fly alloc] initWithImageNamed:FLY_IMAGE andZPosition:Z_POSITION_FLY];
}

- (void) setupPhysics {
#if PHYSICS
   [super setupPhysics];
   self.physicsBody.affectedByGravity = NO;
   //self.physicsBody.dynamic = NO;
    self.physicsBody.collisionBitMask = NoCollision;
    self.physicsBody.categoryBitMask = FlyCollider;
//    self.physicsBody.contactTestBitMask = FrogCollider;
#endif
}

- (void) flyAcrossScreen {
    SKAction *followPathAcrossScreen = [SKAction followPath:[self pathAcrossScreen] asOffset:NO orientToPath:NO duration:10.0];
    [self runAction:[SKAction repeatActionForever:followPathAcrossScreen]];
}


-(CGMutablePathRef) pathAcrossScreen {
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    
    [trackPath moveToPoint:[self getStartingPosition]];
    
    [trackPath addCurveToPoint:[self getEndingPosition]
                 controlPoint1:[self getControlPoint1]
                 controlPoint2:[self getControlPoint2]];
    
    CGPathRef cgPath = trackPath.CGPath;
    CGMutablePathRef pathToDraw = CGPathCreateMutableCopy(cgPath);
    return pathToDraw;
}

//starting position is off the left side of the screen, between 30%-120% screen height
- (CGPoint) getStartingPosition {
    int x = -20;
    int y = [Utils generateRandomNumberBetween:30 and:120];
    NSLog(@"Random is x: %d and y: %d", x, y);
    CGPoint point = [self getPositionForXPercent:x andYPercent:y];
    NSLog(@"point is x: %f and y: %f", point.x, point.y);
    return point;
}

//end position is off the right side of the screen, between 30%-120% screen height
- (CGPoint) getEndingPosition {
    int x = 120;
    int y = [Utils generateRandomNumberBetween:30 and:120];
    return [self getPositionForXPercent:x andYPercent:y];
}

//middle1 position is between 20%-50% along x axis, and 20%-90% screen height
- (CGPoint) getControlPoint1 {
    int x = [Utils generateRandomNumberBetween:20 and:50];
    int y = [Utils generateRandomNumberBetween:20 and:90];
    return [self getPositionForXPercent:x andYPercent:y];
}

//middle2 position is between 50%-90% along x axis, and 20%-90% screen height
- (CGPoint) getControlPoint2 {
    int x = [Utils generateRandomNumberBetween:50 and:90];
    int y = [Utils generateRandomNumberBetween:20 and:90];
    return [self getPositionForXPercent:x andYPercent:y];
}

@end