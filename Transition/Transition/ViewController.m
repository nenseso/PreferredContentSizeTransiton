//
//  ViewController.m
//  Transition
//
//  Created by zhouzihao on 2018/8/18.
//  Copyright © 2018年 nenseso. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "TransitionDelegate.h"
#import "AnimatorOne.h"
#import "PresentationController.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) TransitionDelegate *transionDelegate;
@property (nonatomic, strong) PresentationController *presentationContoller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction:(UIButton *)btn
{
    SecondViewController *secondvc = [[SecondViewController alloc] init];
#warning 这个地方一定要强引用,如果是一个临时变量,会导致返回回来的时候,找不到这个代理,执行不了方法
//    TransitionDelegate *transionDelegate = [[TransitionDelegate alloc] init];
    self.presentationContoller = [[PresentationController alloc] initWithPresentedViewController:secondvc presentingViewController:self];
    secondvc.modalPresentationStyle = UIModalPresentationCustom;
    secondvc.transitioningDelegate = self.presentationContoller;
    [self presentViewController:secondvc animated:YES completion:nil];
}


- (TransitionDelegate *)transionDelegate
{
    if (!_transionDelegate) {
        _transionDelegate = [[TransitionDelegate alloc] init];
    }
    return _transionDelegate;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [AnimatorOne new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [AnimatorOne new];
}




@end
