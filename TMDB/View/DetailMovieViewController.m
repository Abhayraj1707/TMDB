//
//  DetailMovieViewController.m
//  TMDB
//
//  Created by Abhay Raj on 16/03/23.
//

#import "DetailMovieViewController.h"
#import "TMDB-Swift.h"

@interface DetailMovieViewController ()

@end

@implementation DetailMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}



-(void)setTrendingData: (TrendingMovies*)trendingData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", trendingData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = trendingData.title;
            self.lblMovieDes.text = trendingData.overview;
        });
    });
}

-(void)setPopularData: (Movie*)popularData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", popularData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = popularData.title;
            self.lblMovieDes.text = popularData.overview;
        });
    });
}

-(void)setTopRatedData: (Movie*)TopRatedData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", TopRatedData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = TopRatedData.title;
            self.lblMovieDes.text = TopRatedData.overview;
        });
    });
}

-(void)setUpcomingData: (Movie*)UpcomingData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", UpcomingData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = UpcomingData.title;
            self.lblMovieDes.text = UpcomingData.overview;
        });
    });
}

-(void)setTvdData: (PopularTV*)TvData {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", TvData.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = TvData.name;
            self.lblMovieDes.text = TvData.overview;
        });
    });
}

-(void)setData: (Movie*)Data{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", Data.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = Data.title;
            self.lblMovieDes.text = Data.overview;
        });
    });
}

@end
