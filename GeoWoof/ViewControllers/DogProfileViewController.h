//
//  DogProfileViewController.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dog;

@interface DogProfileViewController : UIViewController

@property Dog* dog;

@property (weak, nonatomic) IBOutlet UIImageView *iv_profile;
@property (weak, nonatomic) IBOutlet UILabel *l_name;
@property (weak, nonatomic) IBOutlet UILabel *l_breed;
@property (weak, nonatomic) IBOutlet UILabel *l_age;
@property (weak, nonatomic) IBOutlet UILabel *l_kilometers;


@end