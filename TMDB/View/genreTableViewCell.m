//
//  genreTableViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 04/04/23.
//

#import "genreTableViewCell.h"
#import "CustomCollectionViewCell.h"
#import "CustomBtnCollectionViewCell.h"
@implementation genreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier collectionReUse: (NSString *)collectionReUse collectionViewCell: (UICollectionViewCell *)cell
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;

    self = [self initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self registerCollectionView:[cell class] withReuseIdentifier:collectionReUse];
    [self initCollection:[cell class]];
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    [self initCollection:CustomBtnCollectionViewCell.class];

    return self;
}

-(void)initCollection: (Class)Coll {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 9, 10);
    layout.itemSize = CGSizeMake(200, 300);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[genreIndexedCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerClass:Coll forCellWithReuseIdentifier:genreCollectionViewCellIdentifier];
    
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collectionView];
  
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
