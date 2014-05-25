//
//  JumpJumpSpriteNode.m
//  JumpJumpSK
//
//  Created by Greg Duda on 5/17/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "JumpJumpSpriteNode.h"
#import "MainScene.h"

@implementation JumpJumpSpriteNode

- (id) initWithImageNamed:(NSString *)imageName andZPosition:(int)zPosition {
    if (self = [super initWithImageNamed:imageName]){
        self.zPosition = zPosition;
        [self setupPhysics];
    }
    return self;
}

- (void) setPositionToX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal preventClipping:(BOOL)preventClipping {
    self.position = [self getPositionForX:x outOf:xTotal andY:y outOf:yTotal preventClipping:preventClipping];
}

- (void) setPositionToX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal {
    [self setPositionToX:x outOf:xTotal andY:y outOf:yTotal preventClipping:YES];
}

- (void) setPositionToXPercent:(int)x andYPercent:(int)y {
    self.position = [self getPositionForXPercent:x andYPercent:y];
}

- (void) setPositionToXPercent:(int)x andYPercent:(int)y preventClipping:(BOOL)preventClipping {
    self.position = [self getPositionForXPercent:x andYPercent:y preventClipping:preventClipping];
}


- (void) setupPhysics {
#if PHYSICS
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
#endif
}

- (CGPoint) getPositionForX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal preventClipping:(BOOL)preventClipping {
    float xRatio = (float)x/xTotal;
    float yRatio = (float)y/yTotal;
    return [self getPositionForXPercent:xRatio andYPercent:yRatio];
}

- (CGPoint) getPositionForX:(int)x outOf:(int)xTotal andY:(int)y outOf:(int)yTotal {
    return [self getPositionForX:x outOf:xTotal andY:y outOf:yTotal preventClipping:YES];
}

- (CGPoint) getPositionForXPercent:(int)x andYPercent:(int)y preventClipping:(BOOL)preventClipping {
    float xPercent = (float)x/100;
    float yPercent = (float)y/100;
    int screenWidth = self.scene.size.width;
    int screenHeight = self.scene.size.height;
    float xCoor = (xPercent - 0.5) * screenWidth;
    float yCoor = (0.5 - yPercent) * screenHeight;
    
    if (preventClipping) {
        int widthBuffer = self.frame.size.width/2;
        int heightBuffer = self.frame.size.height/2;
        int minXCoor = (screenWidth/2 * -1) + widthBuffer;
        int maxXCoor = screenWidth/2 - widthBuffer;
        int maxYCoor = screenHeight/2 - heightBuffer;
        int minYCoor = (screenHeight/2 * -1) + heightBuffer;
        
        if (xCoor < minXCoor) xCoor = minXCoor;
        if (xCoor > maxXCoor) xCoor = maxXCoor;
        if (yCoor < minYCoor) yCoor = minYCoor;
        if (yCoor > maxXCoor) yCoor = maxYCoor;
    }
    
    
    CGPoint pointInScene = CGPointMake(xCoor,yCoor);
    return pointInScene;
}

- (CGPoint) getPositionForXPercent:(int)x andYPercent:(int)y {
    return [self getPositionForXPercent:x andYPercent:y preventClipping:YES];
}

@end
