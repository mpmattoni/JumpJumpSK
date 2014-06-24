
//
//  Fly.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "Fly.h"
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
    
    [trackPath moveToPoint:[self randomPointOnScreen]];
    
    [trackPath addCurveToPoint:[self randomPointOnScreen]
                 controlPoint1:[self randomPointOnScreen]
                 controlPoint2:[self randomPointOnScreen]];
    
    CGPathRef cgPath = trackPath.CGPath;
    CGMutablePathRef  pathToDraw = CGPathCreateMutableCopy(cgPath);
    return pathToDraw;
}

//creates a random point on screen with an X and Y of up to 120% of screen size (thus, the point can be outside viewable bounds)
- (CGPoint) randomPointOnScreen {
   return [self getPositionForXPercent:arc4random() % 120 andYPercent:arc4random() % 120 preventClipping:NO];
}

@end