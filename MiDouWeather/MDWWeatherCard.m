//
//  MDWWeatherCard.m
//  MiDouWeather
//
//  Created by j on 16/5/13.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWWeatherCard.h"
#import <Masonry/Masonry.h>

@interface MDWWeatherCard ()

@property (nonatomic, strong) UILabel *date;
@property (nonatomic, strong) UIImageView *weatherIcon;
@property (nonatomic, strong) UILabel *weather;
@property (nonatomic, strong) UILabel *temperature;
@property (nonatomic, strong) UIButton *settings;

@end

@implementation MDWWeatherCard

#pragma mark 点击按钮block
- (void)settingsDidClicked
{
    NSLog(@"点击 settings");
    if (_settingsBlock) {
        _settingsBlock();
    }
}

- (void)settingsClicked:(settingsBtnBlock)block
{
    _settingsBlock = block;
}

#pragma mark 初始化子控件
- (void)setupSubViews
{
    self.layer.cornerRadius = 10.0f;

    self.date = [[UILabel alloc] init];
    self.date.backgroundColor = [UIColor orangeColor];
    self.weatherIcon = [[UIImageView alloc] init];
    self.weatherIcon.backgroundColor = [UIColor blueColor];
    self.weather = [[UILabel alloc] init];
    self.weather.backgroundColor = [UIColor orangeColor];
    self.temperature = [[UILabel alloc] init];
    self.temperature.backgroundColor = [UIColor blueColor];
    self.settings = [[UIButton alloc] init];
    self.settings.backgroundColor = [UIColor blueColor];
    [self.settings addTarget:self action:@selector(settingsDidClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.date];
    [self addSubview:self.weather];
    [self addSubview:self.weatherIcon];
    [self addSubview:self.temperature];
    [self addSubview:self.settings];
    
    // 设置frame
    [self setupSubViewsFrame];
}

- (void)setupSubViewsFrame
{
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 25));
    }];
    [self.weatherIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.equalTo(self.date.mas_bottom).with.offset(20);
    }];
    [self.weather mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.weatherIcon.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 25));
    }];
    [self.temperature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.weather.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [self.settings mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor purpleColor];
        self.layer.cornerRadius = 10.f;
        self.layer.masksToBounds = YES;
        
        [self setupSubViews];
    }
    return self;
}

- (void)layoutSubviews
{

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(4, 4);
    self.layer.shadowRadius = 4;
}


@end
