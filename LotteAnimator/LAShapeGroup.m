//
//  LAShape.m
//  LotteAnimator
//
//  Created by Brandon Withrow on 12/14/15.
//  Copyright © 2015 Brandon Withrow. All rights reserved.
//

#import "LAShapeGroup.h"
#import "LAShapeFill.h"
#import "LAShapePath.h"
#import "LAShapeCircle.h"
#import "LAShapeStroke.h"
#import "LAShapeTransform.h"
#import "LAShapeRectangle.h"

@implementation LAShapeGroup

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary frameRate:(NSNumber *)frameRate {
  self = [super init];
  if (self) {
    [self _mapFromJSON:jsonDictionary frameRate:frameRate];
  }
  return self;
}

- (void)_mapFromJSON:(NSDictionary *)jsonDictionary frameRate:(NSNumber *)frameRate {
  NSArray *itemsJSON = jsonDictionary[@"it"];
  NSMutableArray *items = [NSMutableArray array];
  for (NSDictionary *itemJSON in itemsJSON) {
    NSString *type = itemJSON[@"ty"];
    
    if ([type isEqualToString:@"gr"]) {
      LAShapeGroup *group = [[LAShapeGroup alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:group];
    } else if ([type isEqualToString:@"st"]) {
      LAShapeStroke *stroke = [[LAShapeStroke alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:stroke];
    } else if ([type isEqualToString:@"fl"]) {
      LAShapeFill *fill = [[LAShapeFill alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:fill];
    } else if ([type isEqualToString:@"tr"]) {
      LAShapeTransform *transform = [[LAShapeTransform alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:transform];
    } else if ([type isEqualToString:@"sh"]) {
      LAShapePath *path = [[LAShapePath alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:path];
    } else if ([type isEqualToString:@"el"]) {
      LAShapeCircle *circle = [[LAShapeCircle alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:circle];
    } else if ([type isEqualToString:@"rc"]) {
      LAShapeRectangle *rectangle = [[LAShapeRectangle alloc] initWithJSON:itemJSON frameRate:frameRate];
      [items addObject:rectangle];
    }
  }
  _items = items;
}

@end
