//
//  ProfileCell.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "ProfileCell.h"

@implementation ProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.iv_profile.layer.cornerRadius = self.iv_profile.frame.size.width / 2;
    self.iv_profile.clipsToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
