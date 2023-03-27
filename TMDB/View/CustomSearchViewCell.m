//
//  CustomSearchViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import "CustomSearchViewCell.h"
#import "TMDB-Swift.h"

@implementation CustomSearchViewCell
@synthesize posterImage,movieTitle;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

     
    // Configure the view for the selected state
}


-(void)setData: (Movie*)data {
    self.movieTitle.text = data.title;
    self.releaseDate.text = data.release_date;
    self.rateView.rating = data.vote_average/2;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", data.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImage.image = [UIImage imageWithData:imageData];
        });
    });
}

//-(void)setTVData: (PopularTV*)data {
//    self.movieTitle.text = data.name;
//    self.releaseDate.text = data.first_air_date;
//
//    dispatch_async(dispatch_get_global_queue(0,0), ^{
//        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", data.poster_path];
//        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.posterImage.image = [UIImage imageWithData: imageData];
//        });
//    });
//}


@end
