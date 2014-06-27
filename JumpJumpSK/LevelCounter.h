//
//  LevelCounter.h
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 6/25/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LevelCounter : SKLabelNode


+ (LevelCounter *) getInstance;
- (void) incrementLevelBy:(int)intLevelToAdd;
@end
