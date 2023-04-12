//
//  SearchViewController.m
//  TMDB
//
//  Created by Abhay Raj on 23/03/23.
//

#import "SearchViewController.h"
#import "CustomSearchViewCell.h"
#import "ViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
SearchViewModel* searchViewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    searchViewModel = [[SearchViewModel alloc]init];
}

-(void)reloadData {
    NSLog(@"searched data %@", searchViewModel.filteredData[0].title);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.searchTableView reloadData];
    });
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomSearchViewCell *searchCell = (CustomSearchViewCell *)[tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    
    if (searchCell == nil) {
        searchCell = (CustomSearchViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
    }
    [searchCell setData:searchViewModel.filteredData[indexPath.row]];
    return searchCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailMovieViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailMovieViewController"];
    [vc setData:searchViewModel.filteredData[indexPath.row]];
    [self.navigationController pushViewController:vc animated:NO];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return searchViewModel.filteredData.count;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length >=3){
        [searchViewModel loadSearchDataWithStr:searchText completionHandler:^{
            [self reloadData];
        }];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

@end

