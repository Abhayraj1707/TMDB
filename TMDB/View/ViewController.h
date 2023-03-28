//
//  ViewController.h
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"
#import "SearchViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *topRatedmovies;
@property(nonatomic) NSMutableArray *trendingMovies;
@property(nonatomic) NSMutableArray *trendingTv;
@property (nonatomic) NSMutableArray *genreMovies;
@property(nonatomic) NSMutableArray *popularMovies;
@property(nonatomic) NSMutableArray *popularTv;
@property(nonatomic) NSMutableArray *topRatedTv;



@property (weak, nonatomic) IBOutlet UISegmentedControl *MovieTv;

- (IBAction)movieTv:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

