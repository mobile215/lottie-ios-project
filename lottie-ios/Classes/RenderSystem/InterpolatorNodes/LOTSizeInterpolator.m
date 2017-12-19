//
//  LOTSizeInterpolator.m
//  Lottie
//
//  Created by brandon_withrow on 7/13/17.
//  Copyright © 2017 Airbnb. All rights reserved.
//

#import "LOTPlatformCompat.h"
#import "LOTSizeInterpolator.h"
#import "CGGeometry+LOTAdditions.h"

@implementation LOTSizeInterpolator

- (CGSize)sizeValueForFrame:(NSNumber *)frame {
  CGFloat progress = [self progressForFrame:frame];
  CGSize returnSize;
  if (progress == 0) {
    returnSize = self.leadingKeyframe.sizeValue;
  }else if (progress == 1) {
    returnSize = self.trailingKeyframe.sizeValue;
  } else {
    returnSize = CGSizeMake(LOT_RemapValue(progress, 0, 1, self.leadingKeyframe.sizeValue.width, self.trailingKeyframe.sizeValue.width),
                            LOT_RemapValue(progress, 0, 1, self.leadingKeyframe.sizeValue.height, self.trailingKeyframe.sizeValue.height));
  }
  if (self.hasValueOverride) {
    return self.sizeCallback.callback(self.leadingKeyframe.keyframeTime.floatValue, self.trailingKeyframe.keyframeTime.floatValue, self.leadingKeyframe.sizeValue, self.trailingKeyframe.sizeValue, returnSize, progress, frame.floatValue);
  }
  return returnSize;
}

- (BOOL)hasValueOverride {
  return self.sizeCallback != nil;
}

- (void)setValueCallback:(LOTValueCallback *)valueCallback {
  NSAssert(([valueCallback isKindOfClass:[LOTSizeValueCallback class]]), @"Size Interpolator set with incorrect callback type. Expected LOTSizeValueCallback");
  self.sizeCallback = (LOTSizeValueCallback*)valueCallback;
}

@end
