//
//  TourViewController.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 08/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *iv_image;
@property NSString* str_image;
@property NSUInteger pageIndex;
@end
