//
//  customCollectionViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

#import "customCollectionViewCell.h"
#import "TMDB-Swift.h"

@implementation CustomCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.posterImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 160)];
        self.posterImage.contentMode = UIViewContentModeScaleToFill;
        self.posterImage.layer.cornerRadius = 10;
        self.posterImage.clipsToBounds = true;
        [self.contentView addSubview:self.posterImage];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 100, 75)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = UIColor.whiteColor;
        [self.contentView addSubview:self.titleLabel];
       
        
    }
    return self;
}

-(void)setData: (Movie*)data {
    self.titleLabel.text = data.title;

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", data.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImage.image = [UIImage imageWithData: imageData];
        });
    });
}

-(void)setTrendingData:(TrendingMovies*)trendingData{
    self.titleLabel.text = trendingData.title;
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", trendingData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImage.image = [UIImage imageWithData: imageData];
        });
    });
}

@end
