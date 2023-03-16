//
//  DetailMovieViewController.h
//  TMDB
//
//  Created by Abhay Raj on 16/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailMovieViewController : UIViewController
@property (weak,nonatomic) NSMutableDictionary *dictDetail;
@property(weak,nonatomic)  TrendingMovies *data;
@property (weak,nonatomic) NSString *titleStr;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewMovie;
@property (weak, nonatomic) IBOutlet UILabel *lblMovieTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblMovieDes;

@end

NS_ASSUME_NONNULL_END
