//
//  LAAnimatableValue.h
//  LottieAnimator
//
//  Created by brandon_withrow on 7/19/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@protocol LAAnimatableValue <NSObject>

- (CAKeyframeAnimation *)animationForKeyPath:(NSString *)keypath;
- (BOOL)hasAnimation;

@end
