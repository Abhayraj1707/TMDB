//
//  ProfileTableViewCell.h
//  TMDB
//
//  Created by Abhay Raj on 30/03/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *preference;
@property (weak, nonatomic) IBOutlet UISwitch *enableAdultSearch;
@property (weak, nonatomic) IBOutlet UILabel *enableAdultSearchLbl;
@property (weak, nonatomic) IBOutlet UILabel *useDeviceThemelbl;
@property (weak, nonatomic) IBOutlet UISwitch *useDeviceTheme;


@end

NS_ASSUME_NONNULL_END
