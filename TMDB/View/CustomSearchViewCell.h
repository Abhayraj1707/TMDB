//
//  CustomSearchViewCell.h
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomSearchViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
-(void)setData: (Movie*)data;
@end

NS_ASSUME_NONNULL_END
