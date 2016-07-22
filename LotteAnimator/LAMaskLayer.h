//
//  LAMaskLayer.h
//  LotteAnimator
//
//  Created by brandon_withrow on 7/22/16.
//  Copyright © 2016 Brandon Withrow. All rights reserved.
//

#import "LAAnimatableLayer.h"

@interface LAMaskLayer : LAAnimatableLayer

- (instancetype)initWithMasks:(NSArray<LAMask *> *)masks inComposition:(LAComposition *)comp;

@property (nonatomic, readonly) NSArray<LAMask *> *masks;


@end
