//
//  SearchViewController.h
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import "ViewController.h"
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchMovie;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property(nonatomic) NSMutableArray *filteredData;
//@property(nonatomic) NSMutableArray *filteredTvData;

@end

NS_ASSUME_NONNULL_END
