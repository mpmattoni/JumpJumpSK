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
    return [[ScoreCounter alloc] initWithFontNamed:@"ARIAL BLACK"];
}

- (void) incrementScoreBy:(int)intScoreToAdd  {
    
    score = score + intScoreToAdd;
    NSString *formattedScore = [NSString stringWithFormat:@"%d",score];
    if(formattedScore.length < 3){
        formattedScore = [NSString stringWithFormat:@"0%@", formattedScore];
    }

    self.text = formattedScore;
}


@end
