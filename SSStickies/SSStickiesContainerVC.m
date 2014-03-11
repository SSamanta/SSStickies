//
//  SSStickiesContainerVC.m
//  SSStickies
//
//  Created by Susim on 3/11/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//
@import QuartzCore;
#import "SSStickiesContainerVC.h"
#import "SSStickiesVC.h"
@interface SSStickiesContainerVC ()

@end

@implementation SSStickiesContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNote];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)addNote {
    SSStickiesVC *stickiesVC = [[SSStickiesVC alloc] init];
    stickiesVC.view.frame =  CGRectMake(100, 100, 150, 150);
    [self.view addSubview:stickiesVC.view];
    [self addPanGestureToView:stickiesVC.view];
    [self addLongTapGestureInView:stickiesVC.view];
    
}
- (void)addPanGestureToView:(UIView *)view {
    [view setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMe:)];
    [view addGestureRecognizer:panGestureRecognizer];
}
- (void)panMe:(UIPanGestureRecognizer*)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
}
- (void)addLongTapGestureInView:(UIView *)view {
    [view setUserInteractionEnabled:YES];
    UILongPressGestureRecognizer *longTapRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTapped:)];
    [view addGestureRecognizer:longTapRecognizer];
}
- (void)longTapped:(UIGestureRecognizer *)recognizer {
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:-0.1];
    shake.toValue = [NSNumber numberWithFloat:+0.1];
    shake.duration = 0.1;
    shake.autoreverses = YES;
    shake.repeatCount = 100;
    [recognizer.view.layer addAnimation:shake forKey:nil];
    recognizer.view.alpha = 1.0;
    [UIView animateWithDuration:2.0 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:nil completion:nil];
}
@end
