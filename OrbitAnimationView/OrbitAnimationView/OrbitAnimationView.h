//
//  OrbitAnimationView.h
//  OrbitAnimationView
//
//  Created by YU CHONKAO on 2016/3/12.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OrbitAnimationViewType) {
    OrbitAnimationViewTypeCircle = 0,
    OrbitAnimationViewTypeSquare = 1,
    OrbitAnimationViewTypeTriangle = 2,
};

@interface OrbitAnimationView : UIView

@property (nonatomic, assign) OrbitAnimationViewType animationViewType;
@property (nonatomic, assign) CGFloat duration;
//@property (nonatomic, assign) CGFloat orbitRadius;
@property (nonatomic, assign) CGPoint startPosition;
@property (nonatomic, assign) CGPoint endPosition;
@property (nonatomic, strong) UIColor *shapeColor;



//- (instancetype)orbitAnimationViewWithType:(OrbitAnimationViewType)animationViewType;
- (instancetype)initWithFrame:(CGRect)frame animationViewType:(OrbitAnimationViewType)animationViewType;

- (void)startAnimation;
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END