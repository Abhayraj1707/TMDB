//
//  ViewController.m
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "CustomCollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
UICollectionView *collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(241, 300);
    flowLayout.minimumLineSpacing = 10;
    [flowLayout setSectionInset:UIEdgeInsetsMake(100, 10, 10, 10)];
    [flowLayout setMinimumLineSpacing:10];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    CGRect rect = CGRectMake(0, 0, [self.view frame].size.width, 300);
    collectionView = [[UICollectionView alloc] initWithFrame: rect collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    
//    collectionView.delegate = self;
    [collectionView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"titleCell"];
    
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"overviewCell"];
    [self.view setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];

    [self.view addSubview:collectionView];

    [self checkAPICall];
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
        [collectionView reloadData];
    });
}

- ( UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.section==0)
    {
        CustomCollectionViewCell * titleCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell" forIndexPath:indexPath];
        
        if (titleCell==nil) {
            titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
        }
        [titleCell setData:self.movies[indexPath.row]];
        
        return titleCell;
    }
    else if(indexPath.section==1)
    {
        CustomCollectionViewCell *overviewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"overviewCell" forIndexPath:indexPath];
        if(overviewCell==nil){
            overviewCell = (CustomCollectionViewCell *)[[UICollectionView alloc]init];
        }
        [overviewCell setData:self.movies[indexPath.row]];
        
        return  overviewCell;
    }
    else {
        CustomCollectionViewCell *overviewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"overviewCell" forIndexPath:indexPath];
        return overviewCell;
    }
  
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;

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
@end
