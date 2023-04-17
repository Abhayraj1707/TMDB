//
//  DetailMovieViewController.m
//  TMDB
//
//  Created by Abhay Raj on 16/03/23.
//

#import "DetailMovieViewController.h"
#import "TMDB-Swift.h"
#import "Constants.h"

@interface DetailMovieViewController ()

@end

@implementation DetailMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)setTrendingData: (TrendingMovies*)trendingData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:posterImgUrl, trendingData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = trendingData.title;
            self.lblMovieDes.text = trendingData.overview;
            NSString *ratingText = @(trendingData.vote_average).stringValue;
            self.ratingLbl.text =[ratingText stringByAppendingString:ratingText];
        });
    });
}

-(void)setPopularData: (Movie*)popularData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:posterImgUrl, popularData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = popularData.title;
            self.lblMovieDes.text = popularData.overview;
            NSString *ratingText = @(popularData.vote_average).stringValue;
            self.ratingLbl.text =[ratingTxt stringByAppendingString:ratingText];
        });
    });
}

-(void)setTopRatedData: (Movie*)TopRatedData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:posterImgUrl, TopRatedData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = TopRatedData.title;
            self.lblMovieDes.text = TopRatedData.overview;
            NSString *ratingText = @(TopRatedData.vote_average).stringValue;
            self.ratingLbl.text =[ratingTxt stringByAppendingString:ratingText];
        });
    });
}

-(void)setUpcomingData: (Movie*)UpcomingData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:posterImgUrl, UpcomingData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = UpcomingData.title;
            self.lblMovieDes.text = UpcomingData.overview;
            NSString *ratingText = @(UpcomingData.vote_average).stringValue;
            self.ratingLbl.text =[ratingTxt stringByAppendingString:ratingText];
        });
    });
}

-(void)setTvdData: (PopularTV*)TvData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:posterImgUrl, TvData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = TvData.name;
            self.lblMovieDes.text = TvData.overview;
            NSString *ratingText = @(TvData.vote_average).stringValue;
            self.ratingLbl.text =[ratingTxt stringByAppendingString:ratingText];
        });
    });
}

-(void)setData: (Movie*)Data{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:posterImgUrl, Data.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = Data.title;
            self.lblMovieDes.text = Data.overview;
            NSString *ratingText = @(Data.vote_average).stringValue;
            self.ratingLbl.text =[ratingTxt stringByAppendingString:ratingText];
        });
    });
}

@end
