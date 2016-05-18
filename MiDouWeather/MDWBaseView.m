//
//  MDWBaseView.m
//  MiDouWeather
//
//  Created by j on 16/5/13.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWBaseView.h"

@implementation MDWBaseView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius= 10.f;
}


@end
