//
//  Constants.h
//  JumpJumpSK
//
//  Created by Greg Duda on 5/13/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#ifndef JumpJumpSK_Constants_h
#define JumpJumpSK_Constants_h

//higher number = on top
#define Z_POSITION_FLY 100
#define Z_POSITION_FROG 90
#define Z_POSITION_GREENSNAKE 50
#define Z_POSITION_REDSNAKE 30

#define INITIAL_POSITION_FROG_X 1/2
#define INITIAL_POSITION_FROG_Y 1/2
#define INITIAL_POSITION_REDSNAKE CGPointMake(-400,-100)
#define INITIAL_POSITION_GREENSNAKE CGPointMake(-200,-100)
#define INITIAL_POSITION_FLY CGPointMake(-200,-100)

//for bit masks to determine when Frog/Fly/Snake collide
typedef enum: uint8_t{
    FrogCollider   = 1,
    FlyCollider    = 2,
    SnakeCollider  = 4
}JumpColliderType;


#endif
