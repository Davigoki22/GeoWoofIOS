//
//  WatchProfileViewController.m
//  GeoWoof
//
//  Created by alumno on 23/2/18.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "WatchProfileViewController.h"

@interface WatchProfileViewController ()

@end

@implementation WatchProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem* followButton = [[UIBarButtonItem alloc]initWithTitle:@"Follow" style:UIBarStyleDefault target:self action:@selector(followAcc)];
    [self showData];
    self.navigationItem.rightBarButtonItem = followButton;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)showData{
    self.iv_profile.image = [UIImage imageNamed:self.profile.profileImage];
    self.iv_background.image = [UIImage imageNamed:self.profile.background];
    self.l_name.text = self.profile.name;
    self.l_username.text = self.profile.username;
}

@end
