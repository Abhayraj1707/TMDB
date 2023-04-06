//
//  CustomBtnCollectionViewCell.h
//  TMDB
//
//  Created by Abhay Raj on 10/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomBtnCollectionViewCell : UICollectionViewCell
@property (nonatomic) IBOutlet UILabel *genreTitle;

-(void)setGenreData: (MovieGenre*)genreData;
@end

NS_ASSUME_NONNULL_END
