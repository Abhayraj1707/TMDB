//
//  ProfileViewController.h
//  TMDB
//
//  Created by Abhay Raj on 26/03/23.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UIImageView *pfImg;
@property (weak, nonatomic) IBOutlet UILabel *userName;


@end

NS_ASSUME_NONNULL_END
