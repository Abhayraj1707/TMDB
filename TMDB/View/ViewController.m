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
    //Your code here
    ProfileViewController *profileView = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self.navigationController pushViewController:profileView animated:NO];
//    NSLog(@"profile btn is clicked");
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[AFTableViewCell class]forCellReuseIdentifier:@"horizontalCell"];
//    [self.genreTableView registerClass:[AFTableViewCell class]forCellReuseIdentifier:@"genreHorizontalCell"];
    UIImage *img = [UIImage imageNamed:@"neatflix_name.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [imgView setImage:img];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    //satus bar update to light
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
     target:self
     action:@selector(performSearch:)];
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor;
    
    [self.genreTableView.tableView reloadData];
   
    
    UIImage* profileImg = [UIImage imageNamed:@"Profile_image.png"];

    CGRect frameImg = CGRectMake(20, 0, 20, 20);
//    CGRect frameimg = CGRectMake(0, 0, 5, 5);
    UIButton *profileButton = [[UIButton alloc] initWithFrame:frameImg];
    [profileButton setBackgroundImage:profileImg forState:UIControlStateNormal];
    [profileButton addTarget:self action:@selector(Profile_btn:)
            forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *profileBtnItem =[[UIBarButtonItem alloc] initWithCustomView:profileButton];
    self.navigationItem.leftBarButtonItem = profileBtnItem;

    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(241, 300);
    
    
    [flowLayout setSectionInset:UIEdgeInsetsMake(30, 10, 10, 10)];
    [flowLayout setMinimumLineSpacing:10];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
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
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
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
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
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
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- (void)checkPopularAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    
    [nm getDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(ResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        
        self.popularMovies = [data.results copy];
//        [self reloadData];
        NSLog(@"Popular  data %@", self.popularMovies);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationNone];

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
//        [self reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationNone];

        });
    }];
}

- (void)checkTopRatedTvAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    [nm getPopularTvDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/tv/top_rated?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(PopularTvResponseData * _Nullable data, NSError * _Nullable error) {
        if(error != nil){
            
        }
        self.topRatedTv= [data.results copy];
//        [self reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:4] withRowAnimation:UITableViewRowAnimationNone];

        });
    }];
}

- (void)checkUpcomingAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    [nm getUpcomingDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/upcoming?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(UpcomingResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        
        if ( data != nil ) {
            self.upcomingMovies = [data.results copy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:5] withRowAnimation:UITableViewRowAnimationNone];
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
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- ( UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

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

// after clicking the element of collection view this method will, work you can load a seperate view for that
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
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
    
//    [self navigateToDetailVc:indexPath];
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section==0)
        return _genreMovies.count;
    else if(section==1)
        return _recommendationMovies.count;
    else if(section==2)
        return _trendingMovies.count;
    else if(section==3)
        return _popularMovies.count;
    else if(section==4)
        return  _topRatedmovies.count;
    else if(section==5)
        return self.upcomingMovies.count;
    return 0;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(tableView==self.tableView)
    return 6;
    else
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==self.tableView)
    return  1;
    else
        return self.genreMovies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==self.genreTableView)
    {
        UITableViewCell * cell = [_genreTableView.tableView dequeueReusableCellWithIdentifier:@"genreCell"];
        
        UILabel * label = cell.contentView.subviews[0];
        label.text = @"345";
        return cell;

        
        return [tableView dequeueReusableCellWithIdentifier:@"234"];;
//        static NSString *CellIdentifier = @"genreHorizontalCell";
//        AFTableViewCell *cell = (AFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        if (!cell)
//        {
//            cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
////            cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier collectionReUse:@"genre" collectionViewCell:[CustomBtnCollectionViewCell init]];
//        } else {
//            [cell registerCollectionView:CustomBtnCollectionViewCell.class withReuseIdentifier:@"genre"];
//        }
//        cell.type = @"genre";
//        return cell;
    }
    else{
        static NSString *CellIdentifier = @"horizontalCell";
        AFTableViewCell *cell = (AFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell)
        {
            cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier collectionReUse:@"genre" collectionViewCell:[CustomCollectionViewCell init]];
            //cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        } else {
            if(indexPath.section==0)
            {
                cell.type = @"genre";
                [cell registerCollectionView:CustomBtnCollectionViewCell.class withReuseIdentifier:@"genre1"];
            }
            else if(indexPath.section==1)
            {
                cell.type = @"recommendations";
                [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"recommendations"];
            }
            else if(indexPath.section==2)
            {
                cell.type = @"trending";
                [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"trending"];
            }
            else if(indexPath.section==3) {
                [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"popular"];
                cell.type = @"popular";
            }
            else if(indexPath.section==4)
            {
                [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"topRated"];
                cell.type = @"topRated";
            }
            else if(indexPath.section==5)
            {
                cell.type = @"upcoming";
                [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"upcoming"];
            }

        }
        [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
        [cell reloadInputViews];
        return cell;
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(AFTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger index = cell.collectionView.indexPath.row;
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    AFIndexedCollectionView *collectionView = (AFIndexedCollectionView *)scrollView;
    NSInteger index = collectionView.indexPath.row;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView==self.tableView){
        if(indexPath.section==0)
            return 50;
        else
            return 300;
    }
    else
    {
        return 20;
    }
    return 300;
 
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * view = [[UITableViewHeaderFooterView alloc]initWithFrame:CGRectMake(0, 0, 20, 10)];
    view.textLabel.textColor = UIColor.whiteColor;
    if(tableView==self.tableView)
    {
        if(section==0)
            view.textLabel.text = @"Genres";
        else if(section==1)
            view.textLabel.text = @"Recommendations";
        else if(section==2)
            view.textLabel.text = @"Trending";
        else if(section==3)
            view.textLabel.text = @"Popular";
        else if(section==4)
            view.textLabel.text = @"Top Rated";
        else if(section==5)
            view.textLabel.text = @"Upcoming";
    }
    else
    {
        if(section==0)
            view.textLabel.text = @"hkajkdahda";
    }
    return view;
};

- (IBAction)movieTv:(id)sender {
    [self.tableView reloadData];
}
@end
