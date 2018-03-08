//
//  EditProfileViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iv_profile.layer.cornerRadius = self.iv_profile.frame.size.width / 2;
    self.iv_profile.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeImages:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Select an image"
                                                                   message:@"Select the image you want to change."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* profileAction = [UIAlertAction actionWithTitle:@"Profile" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    UIAlertAction* backgroundAction = [UIAlertAction actionWithTitle:@"Background" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:profileAction];
    [alert addAction:backgroundAction];
    [self presentViewController:alert animated:YES completion:nil];

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
