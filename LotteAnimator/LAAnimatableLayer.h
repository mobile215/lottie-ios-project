//
//  LAAnimatableLayer.h
//  LotteAnimator
//
//  Created by brandon_withrow on 7/21/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface LAAnimatableLayer : CALayer

- (instancetype)initWithDuration:(NSTimeInterval)duration NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong) NSArray *animationSublayers;
@property (nonatomic, strong) NSArray<LAAnimatableLayer *> *childLayers;
@property (nonatomic, readonly) NSTimeInterval laAnimationDuration;

@property (nonatomic, assign) BOOL loopAnimation;
@property (nonatomic, assign) BOOL autoReverseAnimation;
@property (nonatomic, assign) CGFloat animationProgress;

- (void)play;
- (void)pause;

@end
