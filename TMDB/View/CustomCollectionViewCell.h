//
//  customCollectionViewCell.h
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property(nonatomic,strong) UIImageView *posterImage;

-(void)setData: (Movie*)data;
-(void)setTrendingData :(TrendingMovies*)trendingData;
-(void)setPopularTvData :(PopularTV*)popularTvData;

@end

NS_ASSUME_NONNULL_END
