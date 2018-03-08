//
//  DogCollectionViewCell.m
//  GeoWoof
//
//  Created by alumno on 21/2/18.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "DogCollectionViewCell.h"

@implementation DogCollectionViewCell

-(void)awakeFromNib{
    [super awakeFromNib];
    self.iv_dogs.layer.cornerRadius = self.iv_dogs.frame.size.width /2;
    self.iv_dogs.clipsToBounds = YES;
}
@end
