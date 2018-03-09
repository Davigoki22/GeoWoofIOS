//
//  CircularImageView.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 09/03/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "CircularImageView.h"

@implementation CircularImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat radius = self.bounds.size.width / 2.0;
    self.layer.cornerRadius =radius;
}

@end
