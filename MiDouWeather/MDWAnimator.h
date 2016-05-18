//
//  DMWAnimator.h
//  MiDouWeather
//
//  Created by j on 16/5/12.
//  Copyright © 2016年 j. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger ,AnimatorType) {
    AnimatorTypePresent = 0,
    AnimatorTypeDismiss
};

@interface MDWAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimatorType animatorType;

@end
