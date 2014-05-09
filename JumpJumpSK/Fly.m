
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
    return [[Fly alloc] initWithImageNamed:FLY_IMAGE];
}

- (id) initWithImageNamed:(NSString *)name
{
    if (self = [super initWithImageNamed:name]){
        //do stuff
    }
    return self;
}

- (void) animate {
    
//    CGPoint point1 = CGPointMake(120.0f, 50.0f);
//    CGPoint point2 = CGPointMake(240.0f, 150.0f);
//    CGPoint point3 = CGPointMake(360.0f, 50.0f);
//    CGPoint point4 = CGPointMake(480.0f, 100.0f);
//    
//    CGMutablePathRef curvedPath = CGPathCreateMutable();
//    CGPathMoveToPoint(curvedPath, NULL, 0, 0);
//    CGPathAddCurveToPoint(curvedPath, NULL, point1.x, 0, point1.x, 0, point2.x, point2.y);
//    //CGPathAddCurveToPoint(curvedPath, NULL, point2.x, self.imgV.frame.origin.y, point2.x, self.imgV.frame.origin.y, point2.x, point2.y);
//    //CGPathAddCurveToPoint(curvedPath, NULL, point3.x, self.imgV.frame.origin.y, point3.x, self.imgV.frame.origin.y, point3.x, point3.y);
//    //CGPathAddCurveToPoint(curvedPath, NULL, point4.x, self.imgV.frame.origin.y, point4.x, self.imgV.frame.origin.y, point4.x, point4.y);
//    CGPathRelease(curvedPath);
//    
//    //CGMutablePathRef path = CGPathCreateMutable();
//    //CGPathMoveToPoint(path, NULL, 0, 0);
//    //CGPathAddLineToPoint(path, NULL, -50, 100);
//    SKAction *followline = [SKAction followPath:curvedPath asOffset:YES orientToPath:YES duration:3.0];
//    
// 
//    [self runAction:[SKAction repeatActionForever:followline]];
}

@end