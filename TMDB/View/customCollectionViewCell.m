//
//  customCollectionViewCell.m
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

#import "customCollectionViewCell.h"

@implementation customCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * 0.8)];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height * 0.8, frame.size.width, frame.size.height * 0.2)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

@end
