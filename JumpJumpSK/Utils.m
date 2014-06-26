//
//  Utils.m
//  JumpJumpSK
//
//  Created by Greg Duda on 6/25/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (int) generateRandomNumberBetween:(int)lowerBoundary and:(int)upperBoundary {
    int range = upperBoundary - lowerBoundary;
    return (arc4random() % range) + lowerBoundary;
}

@end
