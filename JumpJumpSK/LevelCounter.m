//
//  LevelCounter.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 6/25/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "LevelCounter.h"

@implementation LevelCounter

int level = 0;

+ (LevelCounter *) getInstance {
    return [[LevelCounter alloc] initWithFontNamed:@"ARIAL BLACK"];
}

- (void) incrementLevelBy:(int)intLevelToAdd  {
    
    level = level + intLevelToAdd;
    self.text = [NSString stringWithFormat:@"%d",level];

}


@end
