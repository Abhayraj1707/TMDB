//
//  AFTableViewCell.m
//  AFTabledCollectionView
//
//  Created by Ash Furrow on 2013-03-14.
//  Copyright (c) 2013 Ash Furrow. All rights reserved.
//

#import "AFTableViewCell.h"
#import "CustomCollectionViewCell.h"
#import "CustomBtnCollectionViewCell.h"

@implementation AFIndexedCollectionView

@end

@implementation AFTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
   
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 9, 10);
    layout.itemSize = CGSizeMake(200, 300);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[AFIndexedCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collectionView];
  
    
    return self;
}

-(void)registerCollectionView: (Class)cellClass withReuseIdentifier: (NSString *)reUseIdentifier {
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:reUseIdentifier];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.collectionView.frame = self.contentView.bounds;
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    [self.collectionView setBackgroundColor:[UIColor colorWithRed:39/255.0 green:31/255.0 blue:66/255.0 alpha:1]];
    
    [self.collectionView reloadData];
}

- (void)reloadInputViews {
    [super reloadInputViews];
    [self.collectionView reloadData];
}

- (void) reloadData {
    [self.collectionView reloadData];
}

@end
