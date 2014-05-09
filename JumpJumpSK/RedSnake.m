//
//  RedSnake.m
//  JumpJumpSK
//
//  Created by Greg Duda on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "RedSnake.h"
#define RED_SNAKE_IMAGE @"redsnake-right-1"

@implementation RedSnake

+ (RedSnake *) getInstance {
    return [[RedSnake alloc] initWithImageNamed:RED_SNAKE_IMAGE];
}

- (id) initWithImageNamed:(NSString *)name
{
    if (self = [super initWithImageNamed:name]){
        //do stuff
    }
    return self;
}

- (void) animate {
    
    //redsnake
    NSArray *redSnakeAnimationFramesRight = @[[SKTexture textureWithImageNamed:@"redsnake-right-1"],
                                     [SKTexture textureWithImageNamed:@"redsnake-right-2"],
                                     [SKTexture textureWithImageNamed:@"redsnake-right-3"],
                                     [SKTexture textureWithImageNamed:@"redsnake-right-4"],
                                     [SKTexture textureWithImageNamed:@"redsnake-right-5"],
                                     [SKTexture textureWithImageNamed:@"redsnake-right-6"]];
    NSArray *redSnakeAnimationFramesLeft = @[[SKTexture textureWithImageNamed:@"redsnake-left-1"],
                                    [SKTexture textureWithImageNamed:@"redsnake-left-2"],
                                    [SKTexture textureWithImageNamed:@"redsnake-left-3"],
                                    [SKTexture textureWithImageNamed:@"redsnake-left-4"],
                                    [SKTexture textureWithImageNamed:@"redsnake-left-5"],
                                    [SKTexture textureWithImageNamed:@"redsnake-left-6"]];
    SKAction *redSnakeAnimateRight = [SKAction animateWithTextures:redSnakeAnimationFramesRight timePerFrame:1.0];
    //SKAction *redSnakeMoveWait = [SKAction waitForDuration: 0.5];
    SKAction *redSnakeAnimateLeft = [SKAction animateWithTextures:redSnakeAnimationFramesLeft timePerFrame:1.0];
    SKAction *redSnakeMoveRight = [SKAction moveByX:800 y:0 duration:3.0];
    SKAction *redSnakeMoveLeft = [SKAction moveByX:-800 y:0 duration:3.0];
    
    //create group to run animations and moves in parallel to right
    SKAction *redSnakeActionsRight = [SKAction group:@[redSnakeAnimateRight, redSnakeMoveRight]];
    SKAction *redSnakeActionsLeft = [SKAction group:@[redSnakeAnimateLeft, redSnakeMoveLeft]];
    
    //create a group to run right, then left moves and animations
    SKAction *redSnakeActionComplete =[SKAction sequence:@[redSnakeActionsRight, redSnakeActionsLeft]];
    
    [self runAction:[SKAction repeatActionForever:redSnakeActionComplete]];
}
@end
