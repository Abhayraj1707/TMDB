//
//  SearchViewController.h
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchMovie;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property(nonatomic) NSMutableArray *filteredData;

@end

NS_ASSUME_NONNULL_END
