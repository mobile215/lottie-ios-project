//
//  LATypingDemoViewController.m
//  LottieExamples
//
//  Created by Brandon Withrow on 1/9/17.
//  Copyright © 2017 Brandon Withrow. All rights reserved.
//

#import "LATypingDemoViewController.h"
#import "LAAnimatedTextField.h"

@interface LATypingDemoViewController () <UITextFieldDelegate>

@end

@implementation LATypingDemoViewController {
  LAAnimatedTextField *textField_;
  UITextField *typingField_;
  UISlider *fontSlider_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  textField_ = [[LAAnimatedTextField alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:textField_];
  [textField_ setText:@"Start Typing"];
  
  typingField_ = [[UITextField alloc] initWithFrame:CGRectZero];
  typingField_.text = textField_.text;
  typingField_.delegate = self;
  [self.view addSubview:typingField_];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillShowNotification object:NULL];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillHideNotification object:NULL];
  
  fontSlider_ = [[UISlider alloc] initWithFrame:CGRectZero];
  fontSlider_.minimumValue = 18;
  fontSlider_.maximumValue = 128;
  fontSlider_.value = 36;
  [fontSlider_ addTarget:self action:@selector(sliderUpdated) forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:fontSlider_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [typingField_ becomeFirstResponder];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  fontSlider_.frame = CGRectMake(10, 24, self.view.bounds.size.width - 20, 44);
  textField_.frame = CGRectMake(0, CGRectGetMaxY(fontSlider_.frame), self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(fontSlider_.frame));
  typingField_.frame = CGRectMake(0, -25, self.view.bounds.size.width, 25);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  [textField_ changeCharactersInRange:range toString:string];
  return YES;
}

- (void)keyboardChanged:(NSNotification *)notif {
  NSDictionary *userInfo = notif.userInfo;
  NSValue *keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey];
  [textField_ setScrollInsets:UIEdgeInsetsMake(0, 0, keyboardFrame.CGRectValue.size.height, 0)];
}

- (void)sliderUpdated {
  textField_.fontSize = fontSlider_.value;
}
@end
