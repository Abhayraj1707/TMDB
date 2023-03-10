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

@interface ViewController ()

@end

@implementation ViewController
- (void) performSearch:(id)paramSender{
    NSLog(@"Action method got called.");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[AFTableViewCell class]forCellReuseIdentifier:@"horizontalCell"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"neatflix_name.png"]];
    //    self.navigationItem.titleView = CGSizeMake(50.0, 30.0);
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
     target:self
     action:@selector(performSearch:)];
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor;
    
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
     target:self
     action:@selector(performSearch:)];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(241, 300);
    flowLayout.minimumLineSpacing = 10;
    
    [flowLayout setSectionInset:UIEdgeInsetsMake(40, 10, 10, 10)];
    [flowLayout setMinimumLineSpacing:10];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    
    [self checkAPICall];
    [self checkTreandingAPICall];
    [self checkGenreAPICall];
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
}



- (void)checkAPICall {
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    [nm getDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" reqType:@"GET" headers:headers completionHandler:^(ResponseData * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
        }
        
        self.movies = [data.results copy];
        [self reloadData];
    }];
}

-(void)checkTreandingAPICall{
    NetworkManager *nm = [[NetworkManager alloc] init];
    NSDictionary *headers = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"", nil];
    
    [nm getTrendingDataFromURLWithUrlStr:@"https://api.themoviedb.org/3/trending/all/day?api_key=626c45c82d5332598efa800848ea3571" reqType:@"GET" headers:headers completionHandler:^(TrendingResponseData * _Nullable trendingData, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"treanding error is %@", error);
            
        }
        
        self.trendingMovies = [trendingData.results copy];
        NSLog(@"trending movies data %@", self.trendingMovies);
        [self reloadData];
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
        NSLog(@"genre movies data %@", self.genreMovies);
        [self reloadData];
    }];
}

-(void)reloadData {
    NSLog(@"movie data %@", self.movies);
    NSLog(@" trending data %@", self.trendingMovies);
    NSLog(@"Genre data %@", self.genreMovies);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
    });
}

- ( UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CustomCollectionViewCell * titleCell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"title" forIndexPath:indexPath];
        
        if (titleCell==nil) {
            titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        
        AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
        
        
            [titleCell setData:self.movies[indexPath.row]];
        return titleCell;
//        CustomBtnCollectionViewCell * titleCell = (CustomBtnCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"genred" forIndexPath:indexPath];
//
//        if (titleCell==nil) {
//            titleCell = (CustomBtnCollectionViewCell *)[[UICollectionViewCell alloc]init];
//        }
//
//        //AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
//
//       // [titleCell  setGenreData:self.genreMovies[indexPath.row]];
//
//        return titleCell;
        
    } else if (indexPath.section == 1) {
        CustomCollectionViewCell * titleCell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"title" forIndexPath:indexPath];
        
        if (titleCell==nil) {
            titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        
        AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
        
        
            [titleCell setData:self.movies[indexPath.row]];
        return titleCell;
        
    } else {
        CustomCollectionViewCell * titleCell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"trending" forIndexPath:indexPath];
        
        if (titleCell==nil) {
            titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        
        AFTableViewCell *cell = (AFTableViewCell *)collectionView.superview.superview;
        
            [titleCell setData:self.trendingMovies[indexPath.row]];
        
        return titleCell;
        
    }
    
    
    //    else if([cell.type isEqual:@""])
    //    {
    //        [titleCell setTrendingData:self.trendingMovies[indexPath.row]];
    //    }
    //    else if([cell.type isEqual:@"genre"])
    //    {
    //    }
    return nil;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section==0)
        return _genreMovies.count;
    else if(section==1)
        return _movies.count;
    else
        return _trendingMovies.count;
    return 0;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"horizontalCell";
    
    AFTableViewCell *cell = nil;//(AFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(indexPath.section==0)
    {
        //cell.type = @"genre";
        [cell registerCollectionView:CustomBtnCollectionViewCell.class withReuseIdentifier:@"genred"];
    }
    else if(indexPath.section==1)
    {
        //cell.type = @"title";
        [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"title"];
    }
    else {
        [cell registerCollectionView:CustomCollectionViewCell.class withReuseIdentifier:@"trending"];
        //cell.type = @"trending";
    }
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    [cell reloadInputViews];
    return cell;
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView heightForItemsAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item==0)
    {
        return 300.0;
    }
    else if(indexPath.item==1)
    {
        return 400.0;
    }
    
    return 0;
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
    return 300;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * view = [[UITableViewHeaderFooterView alloc]initWithFrame:CGRectMake(0, 0, 20, 10)];
    view.textLabel.textColor = UIColor.whiteColor;
    
    if(section==0)
        view.textLabel.text = @"Genres";
    else if(section==1)
        view.textLabel.text = @"Trending";
    else if(section==2)
        view.textLabel.text = @"Popular";
    else
        view.textLabel.text = @"Top Rated";
    
    return view;
    
};

@end
