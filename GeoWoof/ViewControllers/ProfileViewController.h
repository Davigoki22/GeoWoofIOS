//
//  ProfileViewController.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 06/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Profile;


@interface ProfileViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UIGestureRecognizerDelegate,UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iv_profileBackground;
@property (weak, nonatomic) IBOutlet UIImageView *iv_profile;
@property (weak, nonatomic) IBOutlet UILabel *l_name;
@property (weak, nonatomic) IBOutlet UILabel *l_username;
@property (weak, nonatomic) IBOutlet UICollectionView *cv_dogs;
@property (weak, nonatomic) IBOutlet UICollectionView *cv_photos;

@property (weak, nonatomic) IBOutlet UIImageView *iv_profileBackground1;
@property (weak, nonatomic) IBOutlet UIImageView *iv_profile1;
@property (weak, nonatomic) IBOutlet UICollectionView *cv_dogs1;
@property (weak, nonatomic) IBOutlet UICollectionView *cv_photos1;
@property (weak, nonatomic) IBOutlet UILabel *l_name1;
@property (weak, nonatomic) IBOutlet UILabel *l_username1;

@property Profile* profile;

- (IBAction)guardar:(UIStoryboardSegue *)segue;
- (IBAction)cancelar:(UIStoryboardSegue *)segue;

@end
