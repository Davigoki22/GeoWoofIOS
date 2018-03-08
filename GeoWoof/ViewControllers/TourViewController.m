//
//  TourViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 08/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "TourViewController.h"

@interface TourViewController ()

@end

@implementation TourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iv_image.image = [UIImage imageNamed:_str_image];
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

@end
