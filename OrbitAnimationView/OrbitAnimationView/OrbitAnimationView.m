//
//  OrbitAnimationView.m
//  OrbitAnimationView
//
//  Created by YU CHONKAO on 2016/3/12.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import "OrbitAnimationView.h"

#define DefaultShapeColor [UIColor grayColor]
const CGFloat DefaultCircleRadius = 5.0f;
const CGFloat DefaultBorderWidth = 10.0f;

@interface OrbitAnimationView()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *squareLayer;
@property (nonatomic, strong) CAShapeLayer *triangleLayer;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, assign) CGFloat circleRadius; // Circle layer
@property (nonatomic, assign) CGFloat borderLength; // Square/Triangle layer

@property (nonatomic, assign) CGFloat orbitRadius;
@property (nonatomic, assign) CGFloat scale;

@end

@implementation OrbitAnimationView

#pragma mark - Initializetion

- (instancetype)initWithFrame:(CGRect)frame animationViewType:(OrbitAnimationViewType)animationViewType {
    
    self = [super initWithFrame:frame];
    if (self) {
        _animationViewType = animationViewType;
        _circleRadius = DefaultCircleRadius;
        _borderLength = DefaultBorderWidth;
        _shapeLayer = [CAShapeLayer layer];

        _orbitRadius = (frame.size.height / 2) - _circleRadius;
        _scale = [[UIScreen mainScreen] scale];
        self.shapeLayer.fillColor = self.shapeColor.CGColor ?: DefaultShapeColor.CGColor;
        [self.layer addSublayer:self.shapeLayer];
        [self startAnimationWithDuration:2.5];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame animationViewType:OrbitAnimationViewTypeCircle];
}

#pragma mark - Animation

- (void)startAnimation {
    [self startAnimationWithDuration:self.duration];
}

- (void)startAnimationWithDuration:(CGFloat)duration {
    
//    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.21f :0.53f :0.56f :0.8f];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *animationPath = [UIBezierPath bezierPath];
    [animationPath moveToPoint:CGPointMake(self.frame.size.width/2, 0)];
    [animationPath addLineToPoint:CGPointMake(0, 0)];
    [animationPath addLineToPoint:CGPointMake(self.frame.size.width/2, 0)];
    [animationPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [animationPath addLineToPoint:CGPointMake(self.frame.size.width/2, 0)];
    animation.path = animationPath.CGPath;
    animation.keyTimes = @[@0.0f, @0.25f, @0.5f, @0.75f];
//    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.repeatCount = HUGE_VAL;
    animation.removedOnCompletion = NO;
    animation.duration = duration;
    animation.calculationMode = kCAAnimationPaced;
    
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[@1.0f, @0.7f, @0.3f, @0.7f, @1.0f];
    scaleAnimation.keyTimes = @[@0.0f, @0.2f, @0.5f, @0.8f, @1.0f];
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation, animation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE_VALF;
    animationGroup.beginTime = CACurrentMediaTime();
    animationGroup.removedOnCompletion = NO;
    
    // animation.rotationMode = kCAAnimationRotateAuto;
    [self.shapeLayer addAnimation:animationGroup forKey:nil];
}

- (void)stopAnimation {
    
}

#pragma mark - Size/Path


- (CGRect)circleFrame {
    CGRect circleFrame = CGRectMake(0, 0, 2 * self.circleRadius, 2 * self.circleRadius);
    return circleFrame;
}

- (UIBezierPath *)circlePath {
    return [UIBezierPath bezierPathWithOvalInRect:[self circleFrame]];
}

- (UIBezierPath *)squarePath {
    return [UIBezierPath bezierPathWithOvalInRect:[self circleFrame]];
}

- (UIBezierPath *)trianglePath {
    return [UIBezierPath bezierPathWithOvalInRect:[self circleFrame]];
}

#pragma mark - Setter

- (void)setShapeColor:(UIColor *)shapeColor {
    self.shapeLayer.fillColor = shapeColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    switch (self.animationViewType) {
        case OrbitAnimationViewTypeCircle: {
            self.shapeLayer.frame = [self circleFrame];
            self.shapeLayer.path = [self circlePath].CGPath;
            break;
        }
        case OrbitAnimationViewTypeSquare: {
            self.shapeLayer.frame = [self circleFrame];
            self.shapeLayer.path = [self circlePath].CGPath;
            break;
        }
        case OrbitAnimationViewTypeTriangle: {
            self.shapeLayer.frame = [self circleFrame];
            self.shapeLayer.path = [self circlePath].CGPath;
            break;
        }
    }
}

@end
