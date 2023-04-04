//
//  genreTableViewCell.h
//  TMDB
//
//  Created by Abhay Raj on 04/04/23.
//

#import <UIKit/UIKit.h>
#import "AFTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface genreIndexedCollectionView : UICollectionView
@property (nonatomic, strong) NSIndexPath *indexPath;

@end


static NSString *genreCollectionViewCellIdentifier = @"genreTitle";


@interface genreTableViewCell : AFTableViewCell

@property (nonatomic, strong) genreIndexedCollectionView *collectionView;

@property(nonatomic) NSString *type;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

-(void)registerCollectionView: (Class)cellClass withReuseIdentifier: (NSString *)reUseIdentifier;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier collectionReUse: (NSString *)collectionReUse collectionViewCell: (UICollectionViewCell *)cell;

@end

NS_ASSUME_NONNULL_END
