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
    self.preference.textColor = UIColor.redColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
