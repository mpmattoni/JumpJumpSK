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


- (void) setPositionToXPercent:(int)x andYPercent:(int)y {
            self.position = [self getPositionForXPercent:x andYPercent:y];
}

- (void) setPositionToXPercent:(int)x andYPercent:(int)y preventClipping:(BOOL)preventClipping {
    self.position = [self getPositionForXPercent:x andYPercent:y preventClipping:preventClipping];
}


- (void) setupPhysics {
#if PHYSICS
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    // RW Debug modified version
    CGPathRef bodyPath = CGPathCreateWithRect( CGRectMake(-self.size.width/2, -self.size.height/2, self.size.width, self.size.height),nil);
    SKShapeNode *shape = [SKShapeNode node];
    shape.path = bodyPath;
    shape.strokeColor = [SKColor colorWithRed:1.0 green:0 blue:0 alpha:0.5];
    shape.lineWidth = 1.0;
    [self addChild:shape];
    CGPathRelease(bodyPath);
#endif
}

- (CGPoint) getPositionForXPercent:(int)x andYPercent:(int)y preventClipping:(BOOL)preventClipping {
    
    float xPercent = (float)x/100;
    float yPercent = (float)y/100;
    float xCoor;
    float yCoor;
    
    if ([self.parent isKindOfClass:[SKSpriteNode class]]){
        
        int parentNodeWidth = self.parent.frame.size.width;
        int parentNodeHeight = self.parent.frame.size.height;
        xCoor = (xPercent - 0.5) * parentNodeWidth;
        yCoor = (0.5 - yPercent) * parentNodeHeight;
        
        if (preventClipping) {
            int widthBuffer = self.frame.size.width/2;
            int heightBuffer = self.frame.size.height/2;
            int minXCoor = (parentNodeWidth/2 * -1) + widthBuffer;
            int maxXCoor = parentNodeWidth/2 - widthBuffer;
            int maxYCoor = parentNodeHeight/2 - heightBuffer;
            int minYCoor = (parentNodeHeight/2 * -1) + heightBuffer;
            
            if (xCoor < minXCoor) xCoor = minXCoor;
            if (xCoor > maxXCoor) xCoor = maxXCoor;
            if (yCoor < minYCoor) yCoor = minYCoor;
            if (yCoor > maxXCoor) yCoor = maxYCoor;
        }
        
        yCoor = yCoor * -1;   //temp hack for clipping
    }else if ([self.parent isKindOfClass:[SKScene class]]){
        int sceneWidth = self.scene.size.width;
        int sceneHeight = self.scene.size.height;
        
        xCoor = xPercent * sceneWidth;
        yCoor = yPercent * sceneHeight;
        
        if (preventClipping) {
            int widthBuffer = self.frame.size.width/2;
            int heightBuffer = self.frame.size.height/2;
            int minXCoor =  widthBuffer;
            int maxXCoor = sceneWidth - widthBuffer;
            int maxYCoor = sceneHeight - heightBuffer;
            int minYCoor = heightBuffer;
            
            if (xCoor < minXCoor) xCoor = minXCoor;
            if (xCoor > maxXCoor) xCoor = maxXCoor;
            if (yCoor < minYCoor) yCoor = minYCoor;
            if (yCoor > maxXCoor) yCoor = maxYCoor;
        }
        
    }else{
        NSLog(@"Unsupported parent for getPositionForXPercent");
    }
    
    
    CGPoint pointInScene = CGPointMake(xCoor,yCoor);
    return pointInScene;
}

- (CGPoint) getPositionForXPercent:(int)x andYPercent:(int)y {
    return [self getPositionForXPercent:x andYPercent:y preventClipping:YES];
}

@end
