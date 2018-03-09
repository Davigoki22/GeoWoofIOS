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
    
    self.iv_profile.layer.cornerRadius = self.iv_profile.frame.size.width / 2;
    self.iv_profile.clipsToBounds = YES;
    self.iv_profile.layer.borderColor = [UIColor whiteColor].CGColor;
    self.iv_profile.layer.borderWidth = 1;
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
    
}

@end
