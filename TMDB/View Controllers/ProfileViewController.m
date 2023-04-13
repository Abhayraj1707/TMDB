//
//  ProfileViewController.m
//  TMDB
//
//  Created by Abhay Raj on 26/03/23.
//

#import "ProfileViewController.h"
#import "Constants.h"

@interface ProfileViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ProfileViewController
-(void) editProfile:(id)paramSender{
    NSLog(@"edit btn is clicked");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = profileText;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editProfile:)];
    self.profileImage.image = [UIImage imageNamed:popconImg];
    self.pfImg.image = [UIImage imageNamed:profileImg];
    self.userName.text = profileUserName;
    self.userName.textColor = UIColor.whiteColor;
    self.neatFlixName.image = [UIImage imageNamed:NeatFlixNameImg];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfileTableViewCell *profileCell = (ProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:profileTableViewIdentifier];
    if (profileCell == nil) {
        profileCell = (ProfileTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:profileTableViewIdentifier];
    }
    return profileCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  1;
}

@end
