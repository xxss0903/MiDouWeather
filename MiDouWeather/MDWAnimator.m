//
//  DMWAnimator.m
//  MiDouWeather
//
//  Created by j on 16/5/12.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWAnimator.h"

@implementation MDWAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.6f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_animatorType == AnimatorTypePresent) {
        [self presentViewControllerWithTransitionContext:transitionContext];
    } else if (_animatorType == AnimatorTypeDismiss) {
        [self dismissViewControllerWithTransitionContext:transitionContext];
    }
}

- (void)presentViewControllerWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSLog(@"presenting animator");
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // fromview的截图,这样在动画之后使fromview不会消失不见
    UIView *snap = [from.view snapshotViewAfterScreenUpdates:NO];
    snap.layer.cornerRadius = 10.f;
    snap.layer.masksToBounds = YES;
    snap.frame = from.view.frame;
    
    to.view.layer.cornerRadius = 10.f;
    to.view.layer.masksToBounds = YES;
    
    
    from.view.hidden = YES;
    // 视图容器
    UIView *viewContainer = [transitionContext containerView];
    [viewContainer addSubview:snap];
    [viewContainer addSubview:to.view];
    
    // 设置视图容器中视图的位置或其他属性，用于后面进行动画，现在设置to.view在屏幕外，动画时将to.view的视图再移动回屏幕内即可
    to.view.frame = CGRectMake(0, SCREENSIZE.height , SCREENSIZE.width, SCREENSIZE.height/2);
    
    // 动画
    [UIView animateWithDuration:0.15 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1.0/0.55 options:0 animations:^{
        snap.transform = CGAffineTransformMakeScale(0.8, 0.8);
        
        to.view.transform = CGAffineTransformMakeTranslation(0, -SCREENSIZE.height/2);

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        // 转场失败
        if ([transitionContext transitionWasCancelled]) {
            from.view.hidden = NO;
            [snap removeFromSuperview];
        }
    }];
}

- (void)dismissViewControllerWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    // 视图容器
    UIView *viewContainer = [transitionContext containerView];
    NSArray *subViews = viewContainer.subviews;
    
    // 获取截图视图
//    UIView *tempView = subViews[MIN(subViews.count, MAX(0, subViews.count - 2))];
    UIView *tempView = (UIView *)[subViews firstObject];
    NSLog(@"%lu", MIN(subViews.count, MAX(0, subViews.count - 2)));
    
    // 动画
    [UIView animateWithDuration:0.15 animations:^{
        from.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            // 失败了，标记失败
            [transitionContext completeTransition:NO];
        } else {
            // 成功了，标记成功，让tovc显示，并移除截图视图
            [transitionContext completeTransition:YES];
            to.view.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}


@end
