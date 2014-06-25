//
//  ScoreCounter.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 6/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "ScoreCounter.h"

@implementation ScoreCounter

int score = 0;

+ (ScoreCounter *) getInstance {
    return [[ScoreCounter alloc] initWithFontNamed:@"ARIAL"];
}

- (void) incrementScoreBy:(int)intScoreToAdd  {
    
    score = score + intScoreToAdd;
    self.text = [NSString stringWithFormat:@"%d",score];
    
}


@end
