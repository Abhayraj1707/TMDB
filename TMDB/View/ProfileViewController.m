//
//  ProfileViewController.m
//  TMDB
//
//  Created by Abhay Raj on 26/03/23.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end



@implementation ProfileViewController
-(void) editProfile:(id)paramSender{
    NSLog(@"edit btn is clicked");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Profile";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editProfile:)];
    self.profileImage.image = [UIImage imageNamed:@"popcorn.jpeg"];
    self.pfImg.image = [UIImage imageNamed:@"profileImg.png"];
    self.userName.text = @"Abhay Raj";
    self.userName.textColor = UIColor.whiteColor;
   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
