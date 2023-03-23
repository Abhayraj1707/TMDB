//
//  customSearchTableViewController.h
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TMDB-Swift.h"

NS_ASSUME_NONNULL_BEGIN


@interface CustomSearchTableViewController : UITableViewController
{
    NSArray *originalData;
    NSMutableArray *searchData;

    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString;

@end

NS_ASSUME_NONNULL_END
