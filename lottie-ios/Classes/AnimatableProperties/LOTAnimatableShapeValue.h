//
//  LOTAnimatableShapeValue.h
//  LottieAnimator
//
//  Created by brandon_withrow on 6/23/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LOTPlatformCompat.h"
#import "LOTAnimatableValue.h"
#import "LOTKeyframe.h"

@interface LOTAnimatableShapeValue : NSObject <LOTAnimatableValue>

- (instancetype)initWithShapeValues:(NSDictionary *)shapeValues frameRate:(NSNumber *)frameRate closed:(BOOL)closed;

@property (nonatomic, readonly) UIBezierPath *initialShape;
@property (nonatomic, readonly) LOTKeyframeGroup *keyframeGroup;

@end
