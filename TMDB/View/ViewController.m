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
    flowLayout.itemSize = CGSizeMake(200, 100);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    collectionView = [[UICollectionView alloc] initWithFrame: [self.view frame] collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    //collectionView.delegate = self;
    [collectionView setBackgroundColor:UIColor.whiteColor];
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"titleCell"];
    
    [self.view setBackgroundColor:UIColor.redColor];
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

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    CustomCollectionViewCell * titleCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell" forIndexPath:indexPath];
    
    if (titleCell==nil) {
        titleCell = (CustomCollectionViewCell *)[[UICollectionViewCell alloc]init];
    }
    [titleCell setData:self.movies[indexPath.row]];
    
    return titleCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
    //return (([Movie])_result.results).count;
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
//
//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
