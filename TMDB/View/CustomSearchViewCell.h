//
//  CustomSearchViewCell.h
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"
#import <RateView/RateView.h>
#import <SDWebImage/SDWebImage.h>



NS_ASSUME_NONNULL_BEGIN

@interface CustomSearchViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet RateView *rateView;
-(void)setData: (Movie*)data;
@end

NS_ASSUME_NONNULL_END
