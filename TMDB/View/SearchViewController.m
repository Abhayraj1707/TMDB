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

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)checkSearchApICall :(NSString*)str {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    NSString *url = [NSString stringWithFormat:@"https://api.themoviedb.org/3/search/movie?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1&include_adult=false&query=%@",str];
    
    [nm getDataFromURLWithUrlStr:url reqType:@"GET" headers:headers completionHandler:^(ResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        self.filteredData = [data.results copy];
        [self reloadData];
    }];
}


//- (void)checkSearchApITVCall :(NSString* )str {
//    NetworkManager *nm = [[NetworkManager alloc] init];
//    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
//
//    NSString *url = [NSString stringWithFormat:@"https://api.themoviedb.org/3/search/tv?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1&include_adult=false&query=%@",str];
//
//    [nm getPopularTvDataFromURLWithUrlStr:url reqType:@"GET" headers:headers completionHandler:^(PopularTvResponseData * _Nullable data, NSError * _Nullable error) {
//        if(error != nil){
//
//        }
//        self.filteredTvData = [data.results copy];
//        [self reloadData];
//
//    }];
//}

-(void)reloadData {
    NSLog(@"searched data %@", self.filteredData);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.searchTableView reloadData];
        
    });
}




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomSearchViewCell *searchCell = (CustomSearchViewCell *)[tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    
    if (searchCell == nil) {
        searchCell = (CustomSearchViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
    }
    [searchCell setData:self.filteredData[indexPath.row]];
//    [searchCell setTVData:self.filteredTvData[indexPath.row]];
    
    return searchCell;
}

// select any row and it will lend you to Details controller

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    AFTableViewCell *cell = (AFTableViewCell *)tableView.superview.superview;
    NSLog(@"i am here");
    DetailMovieViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailMovieViewController"];
    [vc setData:self.filteredData[indexPath.row]];
    [self.navigationController pushViewController:vc animated:NO];
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.filteredData.count;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    [_filteredData removeAllObjects];
    
    if(searchText.length >=3){
//        [self checkSearchApITVCall:searchText];
        [self checkSearchApICall:searchText];
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

@end
