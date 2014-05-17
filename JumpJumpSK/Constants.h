//
//  Constants.h
//  JumpJumpSK
//
//  Created by Greg Duda on 5/13/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#ifndef JumpJumpSK_Constants_h
#define JumpJumpSK_Constants_h

#define Z_POSITION_BACKGROUND -100
#define Z_POSITION_BACK 10
#define Z_POSITION_MIDDLE3 30
#define Z_POSITION_MIDDLE2 40
#define Z_POSITION_MIDDLE1 45
#define Z_POSITION_FRONT3 50
#define Z_POSITION_FRONT2 60
#define Z_POSITION_FRONT1 70
#define Z_POSITION_FOREGROUND 100

#define Z_POSITION_FLY Z_POSITION_FRONT1
#define Z_POSITION_FROG Z_POSITION_FRONT2
#define Z_POSITION_REDSNAKE Z_POSITION_MIDDLE2
#define Z_POSITION_GREENSNAKE Z_POSITION_MIDDLE1

#define INITIAL_POSITION_FROG CGPointMake(0,0)
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
