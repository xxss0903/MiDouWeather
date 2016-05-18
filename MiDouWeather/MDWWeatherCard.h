//
//  MDWWeatherCard.h
//  MiDouWeather
//
//  Created by j on 16/5/13.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWBaseView.h"

typedef void(^settingsBtnBlock)();

@interface MDWWeatherCard : MDWBaseView

@property (nonatomic, copy) settingsBtnBlock settingsBlock;

/**
 *  settings回调
 *
 *  @param block 回调block
 */
- (void)settingsClicked:(settingsBtnBlock)block;

@end
