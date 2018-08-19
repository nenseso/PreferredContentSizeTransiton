//
//  TransitionDelegate.m
//  Transition
//
//  Created by zhouzihao on 2018/8/19.
//  Copyright © 2018年 nenseso. All rights reserved.
//

#import "TransitionDelegate.h"
#import "AnimatorOne.h"


@implementation TransitionDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [AnimatorOne new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [AnimatorOne new];
}


@end
