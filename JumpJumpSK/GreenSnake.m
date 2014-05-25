//
//  GreenSnake.m
//  JumpJumpSK
//
//  Created by Greg Duda on 5/8/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "GreenSnake.h"
#define GREEN_SNAKE_IMAGE @"snake1"

@implementation GreenSnake

+ (GreenSnake *) getInstance {
    return [[GreenSnake alloc] initWithImageNamed:GREEN_SNAKE_IMAGE andZPosition:Z_POSITION_GREENSNAKE];
}

- (void) setupPhysics {
    //no physics
}

- (void) bobAndHiss {
    
    //snake
    NSArray *snakeAnimation = @[[SKTexture textureWithImageNamed:@"snake1"],
                       [SKTexture textureWithImageNamed:@"snake2"],
                       [SKTexture textureWithImageNamed:@"snake3"],
                       [SKTexture textureWithImageNamed:@"snake4"],
                       [SKTexture textureWithImageNamed:@"snake5"],
                       [SKTexture textureWithImageNamed:@"snake6"],
                       [SKTexture textureWithImageNamed:@"snake7"],
                       [SKTexture textureWithImageNamed:@"snake8"],
                       [SKTexture textureWithImageNamed:@"snake9"],
                       [SKTexture textureWithImageNamed:@"snake10"],
                       [SKTexture textureWithImageNamed:@"snake11"],
                       [SKTexture textureWithImageNamed:@"snake12"],
                       [SKTexture textureWithImageNamed:@"snake13"],
                       [SKTexture textureWithImageNamed:@"snake14"],
                       [SKTexture textureWithImageNamed:@"snake15"],
                       [SKTexture textureWithImageNamed:@"snake16"]
                       ];
    SKAction *snakeAction = [SKAction animateWithTextures:snakeAnimation timePerFrame:1.0];
    [self runAction:[SKAction repeatActionForever:snakeAction]];
}

@end
