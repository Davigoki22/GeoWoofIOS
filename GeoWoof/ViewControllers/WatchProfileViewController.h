//
//  WatchProfileViewController.h
//  GeoWoof
//
//  Created by alumno on 23/2/18.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface WatchProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *iv_background;
@property (weak, nonatomic) IBOutlet UIImageView *iv_profile;
@property (weak, nonatomic) IBOutlet UILabel *l_name;
@property (weak, nonatomic) IBOutlet UILabel *l_username;
@property (weak, nonatomic) IBOutlet UICollectionView *cv_dogs;
@property (weak, nonatomic) IBOutlet UIButton *btn_watchDogs;
@property (weak, nonatomic) IBOutlet UICollectionView *cv_images;


@property Profile* profile;
@end
