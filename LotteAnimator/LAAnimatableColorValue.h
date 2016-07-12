//
//  LAAnimatableColorValue.h
//  LotteAnimator
//
//  Created by brandon_withrow on 6/23/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAAnimatableColorValue : NSObject

- (instancetype)initWithColorValues:(NSDictionary *)colorValues;

@property (nonatomic, readonly) UIColor *initialColor;

@property (nonatomic, readonly) NSArray<UIColor *> *colorKeyframes;
@property (nonatomic, readonly) NSArray<NSNumber *> *keyTimes;
@property (nonatomic, readonly) NSArray<CAMediaTimingFunction *> *timingFunctions;
@property (nonatomic, readonly) NSNumber *startFrame;
@property (nonatomic, readonly) NSNumber *durationFrames;

@end
