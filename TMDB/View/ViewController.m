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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[AFTableViewCell class]forCellReuseIdentifier:@"horizontalCell"];
    

    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(241, 300);
    flowLayout.minimumLineSpacing = 10;
    
    [flowLayout setSectionInset:UIEdgeInsetsMake(40, 10, 10, 10)];
    [flowLayout setMinimumLineSpacing:10];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//
//    CGRect rect = CGRectMake(0, 245, [self.view frame].size.width, 275);
    [self.view setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
//
//    //[self.view addSubview:collectionView];

    [self checkAPICall];
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

-(void)reloadData {
    NSLog(@"%@", self.movies);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        //[collectionView reloadData];
    });
}

- ( UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
   
        CustomCollectionViewCell * titleCell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell" forIndexPath:indexPath];
        
        if (titleCell==nil) {
            titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        [titleCell setData:self.movies[indexPath.row]];
        
        return titleCell;
    
////
//
//    else {
//        CustomCollectionViewCell *overviewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"overviewCell" forIndexPath:indexPath];
//        return overviewCell;
//    }
  
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;

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
    if(indexPath.section==0)
    {
        
    }
    static NSString *CellIdentifier = @"horizontalCell";
    
    AFTableViewCell *cell = (AFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    }
    
    return cell;
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame: rect collectionViewLayout:flowLayout];
//    collectionView.dataSource = self;
//
////    collectionView.delegate = self;
//    [collectionView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
//    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"titleCell"];
//
//    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"overviewCell"];
    
    
//    UITableViewCell* horizontalCell = [tableView  dequeueReusableCellWithIdentifier:@"horizontalCell"];
//    horizontalCell.contentView.backgroundColor = UIColor.blueColor;
//    horizontalCell.textLabel.text = @"first";
//    return horizontalCell;

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
    return 3;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(AFTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    [self.tableView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];

    if(section==0)
    {
        
        return @"Genres";
    }
    else if(section==1)
    {
        return @"Popular";
    }
    else
    {
        return @"Top Rated";
    }
}

@end
