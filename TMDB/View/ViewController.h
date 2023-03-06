//
//  ViewController.h
//  TMDB
//
//  Created by Abhay Raj on 01/03/23.
//

#import <UIKit/UIKit.h>
#import "TMDB-Swift.h"

@interface ViewController : UIViewController <UICollectionViewDataSource>

@property (nonatomic) NSMutableArray *movies;

@end

