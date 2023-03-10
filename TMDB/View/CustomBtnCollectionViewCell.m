//
//  CustomBtnCollectionViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 10/03/23.
//

#import "CustomBtnCollectionViewCell.h"
#import "TMDB-Swift.h"

@implementation CustomBtnCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.genreTitle = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 70)];
//        self.genreTitle.configuration = UIViewContentModeScaleToFill;
        self.genreTitle.layer.cornerRadius = 10;
        self.genreTitle.clipsToBounds = true;
        [self.contentView addSubview:self.genreTitle];
        
    }
    return self;
}


-(void)setGenreData: (MovieGenre*)genreData {
    self.genreTitle.titleLabel.text = genreData.name;
}





@end
