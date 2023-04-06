//
//  ViewController.m
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "CustomCollectionViewCell.h"
#import "AFTableViewCell.h"
#import "CustomBtnCollectionViewCell.h"
#import "DetailMovieViewController.h"
#import "ProfileViewController.h"
#import "genreTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize MovieTv;
- (void) performSearch:(id)paramSender{
    SearchViewController *sb = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:sb animated:NO];
}

-(IBAction)Profile_btn:(id)sender
{
    ProfileViewController *profileView = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self.navigationController pushViewController:profileView animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(116, 30);
    [flowLayout setMinimumLineSpacing:10];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    _genreCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 160, 400, 50) collectionViewLayout:flowLayout];
    [self.genreCollectionView setDataSource:self];
    [self.genreCollectionView setDelegate:self];
    [_genreCollectionView registerClass:[CustomBtnCollectionViewCell class] forCellWithReuseIdentifier:@"genreCell"];
    [_genreCollectionView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    [self.view addSubview:_genreCollectionView];
    [_genreCollectionView reloadData];
    
    [self.tableView registerClass:[AFTableViewCell class]forCellReuseIdentifier:@"horizontalCell"];
    UIImage *img = [UIImage imageNamed:@"neatflix_name.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [imgView setImage:img];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
     target:self
     action:@selector(performSearch:)];
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor;
    
    UIImage* profileImg = [UIImage imageNamed:@"Profile_image.png"];
    CGRect frameImg = CGRectMake(20, 0, 20, 20);
    UIButton *profileButton = [[UIButton alloc] initWithFrame:frameImg];
    [profileButton setBackgroundImage:profileImg forState:UIControlStateNormal];
    [profileButton addTarget:self action:@selector(Profile_btn:)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *profileBtnItem =[[UIBarButtonItem alloc] initWithCustomView:profileButton];
    self.navigationItem.leftBarButtonItem = profileBtnItem;
    [self.view setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    
    [self checkGenreAPICall];
    [self checkTopRatedAPICall];
    [self checkTrendingAPICall];
    [self checkPopularAPICall];
    [self checkPopularTvAPICall];
    [self checkTopRatedTvAPICall];
    [self checkTrendingTvAPICall];
    [self checkUpcomingAPICall];
    [self checkRecommendationsAPICall];
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)checkTopRatedAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/top_rated?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(ResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        self.topRatedmovies = [data.results copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:4] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

-(void)checkTrendingAPICall{
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getTrendingDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/trending/movie/day?api_key=626c45c82d5332598efa800848ea3571" reqType:@"GET" headers:headers completionHandler:^(TrendingResponseData * _Nullable trendingData, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"trending error is %@", error);
        }
        self.trendingMovies = [trendingData.results copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

-(void)checkTrendingTvAPICall{
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    [nm getTrendingDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/trending/tv/day?api_key=626c45c82d5332598efa800848ea3571" reqType:@"GET" headers:headers completionHandler:^(TrendingResponseData * _Nullable trendingData, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"trending error is %@", error);
        }
        self.trendingTv = [trendingData.results copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

-(void)checkGenreAPICall{
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    [nm getGenreDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/genre/movie/list?api_key=626c45c82d5332598efa800848ea3571&language=en-US" reqType:@"GET" headers:headers completionHandler:^(GenreData * _Nullable genreData, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Genre error is %@", error);
            
        }
        self.genreMovies = [genreData.genres copy];
        NSLog(@"Genre data %@", self.genreMovies);
    }];
}

- (void)checkPopularAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(ResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        self.popularMovies = [data.results copy];
        NSLog(@"Popular  data %@", self.popularMovies);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- (void)checkPopularTvAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getPopularTvDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/tv/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(PopularTvResponseData * _Nullable data, NSError * _Nullable error) {
        if(error != nil){
            
        }
        self.popularTv = [data.results copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- (void)checkTopRatedTvAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getPopularTvDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/tv/top_rated?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(PopularTvResponseData * _Nullable data, NSError * _Nullable error) {
        self.topRatedTv= [data.results copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- (void)checkUpcomingAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getUpcomingDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/upcoming?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(UpcomingResponseData * _Nullable data, NSError * _Nullable error) {
        if (data != nil ) {
            self.upcomingMovies = [data.results copy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:4] withRowAnimation:UITableViewRowAnimationNone];
            });
        } else {
            NSLog(@"data is nil");
        }
    }];
}
- (void)checkRecommendationsAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    [nm getDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/155/recommendations?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(ResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        self.recommendationMovies = [data.results copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- (IBAction)movieTv:(id)sender {
    [self.tableView reloadData];
}

#pragma mark - ScrollView Datasource

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    if (scrollView == _genreCollectionView) {
        return;
    }
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    AFIndexedCollectionView *collectionView = (AFIndexedCollectionView *)scrollView;
    if (collectionView != nil) {
        NSInteger index = collectionView.indexPath.row;
        self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
    }
}

#pragma mark - TableView Delegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * view = [[UITableViewHeaderFooterView alloc]initWithFrame:CGRectMake(0, 0, 20, 10)];
    view.textLabel.textColor = UIColor.whiteColor;
    if(section==0)
        view.textLabel.text = @"Recommendations";
    else if(section==1)
        view.textLabel.text = @"Trending";
    else if(section==2)
        view.textLabel.text = @"Popular";
    else if(section==3)
        view.textLabel.text = @"Top Rated";
    else if(section==4)
        view.textLabel.text = @"Upcoming";
    
    return view;
};

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(AFTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = cell.collectionView.indexPath.row;
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
}

#pragma mark - TableView Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"horizontalCell";
    AFTableViewCell *cell = (AFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier collectionReUse:@"genre" collectionViewCell:[CustomCollectionViewCell init]];
    } else {
        if(indexPath.section==0)
        {
            cell.type = @"recommendations";
            [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"recommendations"];
        }
        else if(indexPath.section==1)
        {
            cell.type = @"trending";
            [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"trending"];
        }
        else if(indexPath.section==2) {
            [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"popular"];
            cell.type = @"popular";
        }
        else if(indexPath.section==3)
        {
            [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"topRated"];
            cell.type = @"topRated";
        }
        else if(indexPath.section==4)
        {
            cell.type = @"upcoming";
            [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"upcoming"];
        }
    }
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    [cell reloadInputViews];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

#pragma mark - CollectionView Datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- ( UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(collectionView==self.genreCollectionView)
    {
        CustomBtnCollectionViewCell * titleCell = (CustomBtnCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"genreCell" forIndexPath:indexPath];
        if(titleCell==nil)
        {
            titleCell = (CustomBtnCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        [titleCell setGenreData:self.genreMovies[indexPath.row]];
        titleCell.genreTitle.textAlignment = NSTextAlignmentCenter;
        return titleCell;
    }
    else
    {
        CustomCollectionViewCell * titleCell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"title" forIndexPath:indexPath];
        if (titleCell==nil) {
            titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
        if(self.MovieTv.selectedSegmentIndex==0)
        {
            if(([cell.type  isEqual: @"trending"]))
            {
                [titleCell setTrendingData:self.trendingMovies[indexPath.row]];
            }
            else if([cell.type  isEqual: @"popular"])
            {
                NSLog(@"%ld", (long)indexPath.row);;
                [titleCell setData:self.popularMovies[indexPath.row]];
            }
            else if([cell.type isEqual:@"topRated"])
            {
                [titleCell setData:self.topRatedmovies[indexPath.row]];
            }
            else if([cell.type isEqual:@"upcoming"])
            {
                [titleCell setData:self.upcomingMovies[indexPath.row]];
            }
            else if([cell.type isEqual:@"recommendations"])
            {
                [titleCell setData:self.recommendationMovies[indexPath.row]];
            }
        }
        else{
            
            if([cell.type  isEqual: @"popular"]){
                [titleCell setPopularTvData:self.popularTv[indexPath.row]];
            }
            else if([cell.type isEqual:@"topRated"])
            {
                [titleCell setPopularTvData:self.topRatedTv[indexPath.row]];
            }
            else if([cell.type isEqual:@"trending"])
            {
                [titleCell setTrendingData:self.trendingTv[indexPath.row]];
            }
            else if([cell.type isEqual:@"upcoming"])
            {
                [titleCell setData:self.upcomingMovies[indexPath.row]];
            }
            else if([cell.type isEqual:@"recommendations"])
            {
                [titleCell setData:self.recommendationMovies[indexPath.row]];
            }
        }
        return titleCell;
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(collectionView==self.genreCollectionView)
    {
        return _genreMovies.count;
    }
    else{
        AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
        if(self.MovieTv.selectedSegmentIndex==0)
        {
            if(([cell.type  isEqual: @"trending"]))
            {
                return _trendingMovies.count;
            }
            else if([cell.type  isEqual: @"popular"])
            {
                return _popularMovies.count;
            }
            else if([cell.type isEqual:@"topRated"])
            {
                return _topRatedmovies.count;
            }
            else if([cell.type isEqual:@"upcoming"])
            {
                return _upcomingMovies.count;
            }
            else if([cell.type isEqual:@"recommendations"])
            {
                return _recommendationMovies.count;
            }
        }
        else{
            if([cell.type  isEqual: @"popular"]){
                return _popularTv.count;
            }
            else if([cell.type isEqual:@"topRated"])
            {
                return _topRatedTv.count;
            }
            else if([cell.type isEqual:@"trending"])
            {
                return _trendingTv.count;
            }
            else if([cell.type isEqual:@"upcoming"])
            {
                return _upcomingMovies.count;
            }
            else if([cell.type isEqual:@"recommendations"])
            {
                return _recommendationMovies.count;
            }
        }
    }
    return 0;
}

#pragma mark - CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(collectionView==self.genreCollectionView)
    {
        
    }
    else{
        AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
        DetailMovieViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailMovieViewController"];
        if(self.MovieTv.selectedSegmentIndex==0)
        {
            if([cell.type  isEqual: @"trending"])
            {
                [vc setTrendingData:self.trendingMovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type  isEqual: @"popular"])
            {
                [vc setPopularData:self.popularMovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type isEqual:@"topRated"])
            {
                [vc setTopRatedData:self.topRatedmovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type isEqual:@"upcoming"])
            {
                [vc setUpcomingData:self.upcomingMovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type isEqual:@"recommendations"])
            {
                [vc setData:self.recommendationMovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
        }
        else
        {
            if([cell.type  isEqual: @"trending"])
            {
                [vc setTrendingData:self.trendingTv[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type  isEqual: @"popular"])
            {
                [vc setTvdData:self.popularTv[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type isEqual:@"topRated"])
            {
                [vc setTvdData:self.topRatedTv[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type isEqual:@"upcoming"])
            {
                [vc setUpcomingData:self.upcomingMovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
            else if([cell.type isEqual:@"recommendations"])
            {
                [vc setData:self.recommendationMovies[indexPath.row]];
                [self.navigationController pushViewController:vc animated:NO];
            }
        }
    }
}
@end
