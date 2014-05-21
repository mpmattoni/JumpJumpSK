
//
//  Fly.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "Fly.h"

#define FLY_IMAGE @"fly"

@implementation Fly

+ (Fly *) getInstance {
    return [[Fly alloc] initWithImageNamed:FLY_IMAGE andZPosition:Z_POSITION_FLY];
}

- (void) setupPhysics {
   [super setupPhysics];
   self.physicsBody.affectedByGravity = NO;
   self.physicsBody.collisionBitMask = NoCollision;
   self.physicsBody.categoryBitMask = FlyCollider;
}

- (void) flyAcrossScreen {
    SKAction *followPathAcrossScreen = [SKAction followPath:[self pathAcrossScreen] asOffset:NO orientToPath:NO duration:10.0];
    [self runAction:[SKAction repeatActionForever:followPathAcrossScreen]];
}


-(CGMutablePathRef) pathAcrossScreen {
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    
    CGPoint startingPoint = [self getPositionForXPercent:10 andYPercent:90 preventClipping:NO];
    CGPoint endingPoint = [self getPositionForXPercent:120 andYPercent:30 preventClipping:NO];
    CGPoint intermediate1 = [self getPositionForXPercent:60 andYPercent:70 preventClipping:NO];
    CGPoint intermediate2 = [self getPositionForXPercent:65 andYPercent:20 preventClipping:NO];
    
    [trackPath moveToPoint:startingPoint];
    
    [trackPath addCurveToPoint:endingPoint
                 controlPoint1:intermediate1
                 controlPoint2:intermediate2];
    
    CGPathRef cgPath = trackPath.CGPath;
    CGMutablePathRef  pathToDraw = CGPathCreateMutableCopy(cgPath);
    return pathToDraw;
}

@end