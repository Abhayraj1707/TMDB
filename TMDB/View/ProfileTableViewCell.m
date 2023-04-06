//
//  ProfileTableViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 30/03/23.
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.preference.text = @"Preference";
    self.preference.textColor = UIColor.whiteColor;
    self.enableAdultSearchLbl.text = @"Enable Adult search";
    self.enableAdultSearchLbl.textColor = UIColor.whiteColor;
    self.useDeviceThemelbl.text = @"Use Device Theme";
    self.useDeviceThemelbl.textColor = UIColor.whiteColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
