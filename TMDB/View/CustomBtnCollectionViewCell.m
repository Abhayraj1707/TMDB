//
//  CustomBtnCollectionViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 10/03/23.
//

#import "CustomBtnCollectionViewCell.h"
#import "TMDB-Swift.h"

@interface CustomBtnCollectionViewCell (){
    UILabel *currentLabel;
}

@end

@implementation CustomBtnCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.genreTitle = [[UILabel alloc]initWithFrame:CGRectMake(7, 0,frame.size.width, 35)];
        self.genreTitle.layer.cornerRadius = 15;
        self.genreTitle.clipsToBounds = true;
        self.genreTitle.backgroundColor = [UIColor colorWithRed:43.0/255 green:33.0/255 blue:72.0/255 alpha:1];
        [self.contentView addSubview:self.genreTitle];
    }
    return self;
}

-(void)setGenreData: (MovieGenre*)genreData {
    self.genreTitle.text = genreData.name;
    self.genreTitle.textColor = UIColor.whiteColor;
}

@end
