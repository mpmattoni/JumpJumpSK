//
//  TimeCounter.h
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 6/27/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TimeCounter : SKLabelNode

+ (TimeCounter *) getInstance;
- (void) initializeTimerwithSeconds: (int)intSeconds;
- (void) stopTimer;
- (void) startTimer;

@end
