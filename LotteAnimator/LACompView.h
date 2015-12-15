//
//  LACompView.h
//  LotteAnimator
//
//  Created by Brandon Withrow on 12/14/15.
//  Copyright © 2015 Brandon Withrow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LACompView : UIView

- (instancetype)initWithModel:(LAScene *)model;

@property (nonatomic, strong) LAScene *sceneModel;
@property (nonatomic, assign) BOOL debugModeOn;

@end
