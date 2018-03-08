//
//  ProfileCell.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv_profile;
@property (weak, nonatomic) IBOutlet UILabel *l_username;
@property (weak, nonatomic) IBOutlet UILabel *l_name;

@end
