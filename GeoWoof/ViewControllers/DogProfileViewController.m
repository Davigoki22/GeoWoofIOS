//
//  DogProfileViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "DogProfileViewController.h"
#import "Dog.h"

@interface DogProfileViewController ()

@end

@implementation DogProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showData];
    
    self.navigationItem.title = self.dog.name;
    self.iv_profile.layer.cornerRadius = self.iv_profile.frame.size.width / 2;
    self.iv_profile.clipsToBounds = YES;

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
    self.iv_profile.image = [UIImage imageNamed:self.dog.image];
    self.l_name.text = self.dog.name;
    self.l_age.text = self.dog.age;
    self.l_breed.text = self.dog.breed;
    self.l_kilometers.text = [NSString stringWithFormat:@"%f",self.dog.kilometers];
}

@end
