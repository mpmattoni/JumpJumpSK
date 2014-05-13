//
//  MyScene.m
//  JumpJumpSK
//
//  Created by Matthew Mattoni on 4/24/14.
//  Copyright (c) 2014 DaoSoft, LLC. All rights reserved.
//

#import "MyScene.h"
#import "Frog.h"
#import "RedSnake.h"
#import "GreenSnake.h"
#import "Fly.h"

#define Z_ORDER_FOREGROUND 100
#define Z_ORDER_BACKGROUND -100
#define Z_ORDER_FRONT 50
#define Z_ORDER_MIDDLE 30
#define Z_ORDER_BACK 10

@interface MyScene ()
{}
@property (nonatomic,strong) Frog *myFrog;
@property (nonatomic,strong) Fly *myFly;
@property (nonatomic,strong) RedSnake *redSnake;
@property (nonatomic,strong) GreenSnake *greenSnake;

@end


@implementation MyScene{
    SKSpriteNode *myBackground;
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [self createBackground];
        [self createPhysicsWorld];
        [self addAllSprites];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [self.myFrog jump];
    
    SKShapeNode *yourline = [SKShapeNode node];
    //CGMutablePathRef pathToDraw = CGPathCreateMutable();
    //NSLog(@"Drawing a path from origin: %@ to frame size: %@", NSStringFromCGPoint(self.frame.origin), NSStringFromCGSize(self.frame.size));
    //CGPathMoveToPoint(pathToDraw, NULL, self.frame.origin.x, self.frame.origin.y);
    //CGPathAddLineToPoint(pathToDraw, NULL, self.frame.size.width, self.frame.size.height);
    yourline.path = [self drawFlyPath:1 setFlightPath:self.frame.size.width];
    [yourline setStrokeColor:[UIColor redColor]];
    [self addChild:yourline];
}


-(CGMutablePathRef)drawFlyPath:(int)level setFlightPath:(int)screenWidth {
    
    
    int screenPosition = (int)screenWidth;
    srandom(time(NULL));
    //int direction = (random()%(int)level);
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    [trackPath moveToPoint:CGPointMake(0,200 + 10)];
    
    [trackPath addCurveToPoint:CGPointMake(screenPosition, 200 - 5 )
                 controlPoint1:CGPointMake(600, 400 )
                 controlPoint2:CGPointMake(800, 300 )];
    
    CGPathRef cgPath = trackPath.CGPath;
    
    CGMutablePathRef  pathToDraw = CGPathCreateMutableCopy(cgPath);

    return pathToDraw;

}

//-(void) drawFlies:(int *)level setFlightPath:(int *)screenWidth {
//    
//    int screenPosition = (int)screenWidth;
//    srandom( time( NULL ) );
//    
//    flies = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 10; i++) {
//        
//        
//        
//        //  int displacement = random()%100;
//        int direction = (random() % (int)level);
//        
//        
//        if (direction == 0) {
//            UIImage *flyImage = [UIImage imageNamed:@"fly.png"];
//            fly = [CALayer layer];
//            fly.contents = (id)flyImage.CGImage;
//            fly.bounds = CGRectMake(0, 0, flyImage.size.width, flyImage.size.height);
//            fly.position = CGPointMake(0 + i*20, 300 - i*20);
//            
//            [fly setOpacity:1];
//            CABasicAnimation *buzz = [CABasicAnimation animationWithKeyPath:@"opacity"];
//            buzz.fromValue = [NSNumber numberWithFloat:0.5];
//            buzz.toValue = [NSNumber numberWithFloat:1.0];
//            buzz.duration = 0.1;
//            buzz.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//            buzz.repeatCount = HUGE_VALF;
//            
//            
//            UIBezierPath *trackPath = [UIBezierPath bezierPath];
//            [trackPath moveToPoint:P(0,200 + i*10)];
//            
//            [trackPath addCurveToPoint:P(screenPosition, 200 - i*5 )
//                         controlPoint1:P(600, 400 )
//                         controlPoint2:P(800, 300 )];
//            
//            
//            
//            racetrack = [CAShapeLayer layer];
//            racetrack.path = trackPath.CGPath;
//            racetrack.strokeColor = [UIColor blackColor].CGColor;
//            racetrack.fillColor = [UIColor clearColor].CGColor;
//            racetrack.lineWidth = 2.0;
//            
//            
//            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//            anim.path = trackPath.CGPath;
//            anim.rotationMode = kCAAnimationRotateAuto;
//            anim.repeatCount = HUGE_VALF;
//            anim.duration = 10 - (int)level + random()%10;
//            [fly addAnimation:anim forKey:@"position"];
//            
//            
//            //    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//            //   CGPoint startPt = CGPointMake(fly.bounds.size.width / -2,
//            //                          fly.position.y );
//            //  CGPoint endPt = CGPointMake(self.bounds.size.width + flyImage.size.width / 2,
//            //                      fly.position.y);
//            // anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//            // anim.fromValue = [NSValue valueWithCGPoint:endPt];
//            // anim.toValue = [NSValue valueWithCGPoint:startPt];
//            // anim.repeatCount = HUGE_VALF;
//            // anim.duration = 8 + random()%10;
//            // anim.beginTime = CACurrentMediaTime();
//            // [fly addAnimation:anim forKey:@"position"];
//            [fly addAnimation:buzz forKey:@"opacity"];
//            
//            [flies addObject:fly];
//            
//        } else {
//            UIImage *flyImage = [UIImage imageNamed:@"fly.png"];
//            fly = [CALayer layer];
//            fly.contents = (id)flyImage.CGImage;
//            fly.bounds = CGRectMake(0, 0, flyImage.size.width, flyImage.size.height);
//            fly.position = CGPointMake(0,
//                                       flyImage.size.height / 2 + random()%50 + random()%50 + 200);
//            
//            CABasicAnimation *buzz = [CABasicAnimation animationWithKeyPath:@"opacity"];
//            buzz.fromValue = [NSNumber numberWithFloat:0.5];
//            buzz.toValue = [NSNumber numberWithFloat:1.0];
//            buzz.duration = 0.1;
//            buzz.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//            buzz.repeatCount = HUGE_VALF;
//            
//            
//            
//            UIBezierPath *trackPath = [UIBezierPath bezierPath];
//            [trackPath moveToPoint:P(screenPosition, 300 + random()%20)];
//            [trackPath addCurveToPoint:P(0, 300 + random()%20)
//                         controlPoint1:P(150 + random()%100, 100 + random()%20)
//                         controlPoint2:P(150 + random()%100, 200 + random()%200)];
//            
//            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//            anim.path = trackPath.CGPath;
//            anim.rotationMode = kCAAnimationRotateAuto;
//            anim.repeatCount = HUGE_VALF;
//            anim.duration = 11 - (int)level + random()%10;
//            [fly addAnimation:anim forKey:@"position"];
//            
//            
//            
//            [fly addAnimation:buzz forKey:@"opacity"];
//            
//            [flies addObject:fly];
//            
//        }
//        
//        
//    }
//    
//}




-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)createBackground{
    myBackground = [SKSpriteNode spriteNodeWithImageNamed:@"jungle_background_640x960"];
    myBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    myBackground.name = @"Background";
    myBackground.zPosition = Z_ORDER_BACKGROUND;
    [self addChild:myBackground];
}

-(void)createPhysicsWorld{
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    self.physicsWorld.gravity = CGVectorMake(0, -9.8);

    //mySnake.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:100];
}

-(void)addAllSprites{
    //frog
    self.myFrog = [Frog getInstance];
    [self.myFrog lookAround];
    self.myFrog.position = CGPointMake(0,-125);
    self.myFrog.zPosition = Z_ORDER_FOREGROUND;
    [myBackground addChild:self.myFrog];
    
    //snake
    self.greenSnake = [GreenSnake getInstance];
    [self.greenSnake animate];
    self.greenSnake.position = CGPointMake(-200,-100);
    self.greenSnake.zPosition = Z_ORDER_MIDDLE;
    [myBackground addChild:self.greenSnake];
    
    //redSnake
    self.redSnake = [RedSnake getInstance];
    [self.redSnake animate];
    self.redSnake.position = CGPointMake(-400,-100);
    self.redSnake.zPosition = Z_ORDER_BACK;
    [myBackground addChild:self.redSnake];
    
    //fly
    self.myFly = [Fly getInstance];
    [self.myFly animate];
    self.myFly.position = CGPointMake(0,-125);
    self.myFly.zPosition = Z_ORDER_FOREGROUND+1;
    [myBackground addChild:self.myFly];
}
@end
