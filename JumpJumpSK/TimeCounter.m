//
//  TimeCounter.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 6/27/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "TimeCounter.h"

@interface TimeCounter()

//private interface
//@property (nonatomic, assign) CFTimeInterval timeToDisplay;
//NSTimeInterval ??
@end

@implementation TimeCounter

int seconds = 0;
bool blRunning = false;


+ (TimeCounter *) getInstance{
    return [[TimeCounter alloc] initWithFontNamed:@"ARIAL BLACK"];
}

- (void) initializeTimerwithSeconds:(int)intSeconds{
    //sets timer value to initial value
    seconds = intSeconds;
    
}

- (void) stopTimer{
    //stops timer
    blRunning = false;
    
}

- (void) tick{
    //updates timer display with current remaining time
    if(blRunning) {
        //set text here
    }
    
}


@end
