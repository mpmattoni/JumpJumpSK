
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
   //self.physicsBody.dynamic = NO;
    self.physicsBody.collisionBitMask = NoCollision;
    self.physicsBody.categoryBitMask = FlyCollider;
//    self.physicsBody.contactTestBitMask = FrogCollider;
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

//-(void) drawFlies:(int *)level setFlightPath:(int *)screenWidth {
//
//    int screenPosition = (int)screenWidth;
//    srandom( time( NULL ) );
//
//    flies = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 10; i++) {
//
//
//
//        //  int displacement = random()%100;
//        int direction = (random() % (int)level);
//
//
//        if (direction == 0) {
//            UIImage *flyImage = [UIImage imageNamed:@"fly.png"];
//            fly = [CALayer layer];
//            fly.contents = (id)flyImage.CGImage;
//            fly.bounds = CGRectMake(0, 0, flyImage.size.width, flyImage.size.height);
//            fly.position = CGPointMake(0 + i*20, 300 - i*20);
//
//            [fly setOpacity:1];
//            CABasicAnimation *buzz = [CABasicAnimation animationWithKeyPath:@"opacity"];
//            buzz.fromValue = [NSNumber numberWithFloat:0.5];
//            buzz.toValue = [NSNumber numberWithFloat:1.0];
//            buzz.duration = 0.1;
//            buzz.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//            buzz.repeatCount = HUGE_VALF;
//
//
//            UIBezierPath *trackPath = [UIBezierPath bezierPath];
//            [trackPath moveToPoint:P(0,200 + i*10)];
//
//            [trackPath addCurveToPoint:P(screenPosition, 200 - i*5 )
//                         controlPoint1:P(600, 400 )
//                         controlPoint2:P(800, 300 )];
//
//
//
//            racetrack = [CAShapeLayer layer];
//            racetrack.path = trackPath.CGPath;
//            racetrack.strokeColor = [UIColor blackColor].CGColor;
//            racetrack.fillColor = [UIColor clearColor].CGColor;
//            racetrack.lineWidth = 2.0;
//
//
//            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//            anim.path = trackPath.CGPath;
//            anim.rotationMode = kCAAnimationRotateAuto;
//            anim.repeatCount = HUGE_VALF;
//            anim.duration = 10 - (int)level + random()%10;
//            [fly addAnimation:anim forKey:@"position"];
//
//
//            //    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//            //   CGPoint startPt = CGPointMake(fly.bounds.size.width / -2,
//            //                          fly.position.y );
//            //  CGPoint endPt = CGPointMake(self.bounds.size.width + flyImage.size.width / 2,
//            //                      fly.position.y);
//            // anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//            // anim.fromValue = [NSValue valueWithCGPoint:endPt];
//            // anim.toValue = [NSValue valueWithCGPoint:startPt];
//            // anim.repeatCount = HUGE_VALF;
//            // anim.duration = 8 + random()%10;
//            // anim.beginTime = CACurrentMediaTime();
//            // [fly addAnimation:anim forKey:@"position"];
//            [fly addAnimation:buzz forKey:@"opacity"];
//
//            [flies addObject:fly];
//
//        } else {
//            UIImage *flyImage = [UIImage imageNamed:@"fly.png"];
//            fly = [CALayer layer];
//            fly.contents = (id)flyImage.CGImage;
//            fly.bounds = CGRectMake(0, 0, flyImage.size.width, flyImage.size.height);
//            fly.position = CGPointMake(0,
//                                       flyImage.size.height / 2 + random()%50 + random()%50 + 200);
//
//            CABasicAnimation *buzz = [CABasicAnimation animationWithKeyPath:@"opacity"];
//            buzz.fromValue = [NSNumber numberWithFloat:0.5];
//            buzz.toValue = [NSNumber numberWithFloat:1.0];
//            buzz.duration = 0.1;
//            buzz.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//            buzz.repeatCount = HUGE_VALF;
//
//
//
//            UIBezierPath *trackPath = [UIBezierPath bezierPath];
//            [trackPath moveToPoint:P(screenPosition, 300 + random()%20)];
//            [trackPath addCurveToPoint:P(0, 300 + random()%20)
//                         controlPoint1:P(150 + random()%100, 100 + random()%20)
//                         controlPoint2:P(150 + random()%100, 200 + random()%200)];
//
//            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//            anim.path = trackPath.CGPath;
//            anim.rotationMode = kCAAnimationRotateAuto;
//            anim.repeatCount = HUGE_VALF;
//            anim.duration = 11 - (int)level + random()%10;
//            [fly addAnimation:anim forKey:@"position"];
//
//
//
//            [fly addAnimation:buzz forKey:@"opacity"];
//
//            [flies addObject:fly];
//
//        }
//
//
//    }
//
//}

@end