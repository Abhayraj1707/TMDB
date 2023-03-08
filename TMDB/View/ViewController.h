//
//  ViewController.h
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *movies;
@property(nonatomic) NSMutableArray *trendingMovies;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

