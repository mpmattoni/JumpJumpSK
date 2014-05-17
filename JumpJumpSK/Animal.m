//
//  Animal.m
//  JumpJumpSK
//
//  Created by Greg Duda on 5/17/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (id) initWithImageNamed:(NSString *)imageName andPosition:(CGPoint)position andZPosition:(int)zPosition{
    if (self = [super initWithImageNamed:imageName]){
        self.position = position;
        self.zPosition = zPosition;
        [self setupPhysics];
    }
    return self;
}

- (void) setupPhysics {
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.frame.size.height/2];
}

@end
