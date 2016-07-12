//
//  LAShapeTransform.h
//  LotteAnimator
//
//  Created by Brandon Withrow on 12/15/15.
//  Copyright © 2015 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LAAnimatableNumberValue;
@class LAAnimatablePointValue;
@class LAAnimatableScaleValue;

@interface LAShapeTransform : NSObject

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary frameRate:(NSNumber *)frameRate;

@property (nonatomic, readonly) LAAnimatablePointValue *position;
@property (nonatomic, readonly) LAAnimatablePointValue *anchor;
@property (nonatomic, readonly) LAAnimatableScaleValue *scale;
@property (nonatomic, readonly) LAAnimatableNumberValue *rotation;
@property (nonatomic, readonly) LAAnimatableNumberValue *opacity;

@end
