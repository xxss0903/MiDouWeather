//
//  MDWSettingsCell.m
//  MiDouWeather
//
//  Created by j on 16/5/4.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWSettingsCell.h"

@interface MDWSettingsCell ()

@property (nonatomic, strong) UISwitch *switcher;

@end

@implementation MDWSettingsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.switcher = [[UISwitch alloc] init];
        self.accessoryView = self.switcher;
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
