//
//  ScoreCounter.h
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 6/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ScoreCounter : SKLabelNode

+ (ScoreCounter *) getInstance;
- (void) incrementScoreBy:(int)intScoreToAdd;

@end

