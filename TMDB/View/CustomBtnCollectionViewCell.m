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
        self.genreTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,frame.size.width, 30)];
        self.genreTitle.layer.cornerRadius = 10;
        self.genreTitle.clipsToBounds = true;
        self.genreTitle.backgroundColor = UIColor.yellowColor;
        [self.contentView addSubview:self.genreTitle];
    }
    return self;
}

-(void)setGenreData: (MovieGenre*)genreData {
    self.genreTitle.text = genreData.name;
    self.genreTitle.textColor = UIColor.blueColor;
}

@end
