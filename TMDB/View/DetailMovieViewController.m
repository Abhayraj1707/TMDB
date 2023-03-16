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

    [self setData:self.data];
}


-(void)setData: (TrendingMovies*)data {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *urlStr = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", data.poster_path];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgViewMovie.image = [UIImage imageWithData: imageData];
            self.lblMovieTitle.text = data.title;
            self.lblMovieDes.text = data.overview;
        });
    });
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
