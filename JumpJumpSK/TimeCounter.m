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
NSTimer *timer;


+ (TimeCounter *) getInstance{
    return [[TimeCounter alloc] initWithFontNamed:@"ARIAL BLACK"];
}

- (void) initializeTimerwithSeconds:(int)intSeconds{
    //sets timer value to initial value
    seconds = intSeconds;
    self.text = [NSString stringWithFormat:@"%d", seconds];
    
}

- (void) stopTimer{
    //stops timer
    blRunning = false;
    [timer invalidate];
    
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(seconds > 0 ){
        seconds -- ;
        self.text = [NSString stringWithFormat:@"%d", seconds];
    }
    
}

- (void) startTimer{
    //stops timer
    blRunning = true;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
}

@end
