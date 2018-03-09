//
//  MapViewController.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 27/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn_start;
@property UIButton* button;
@property (weak, nonatomic) IBOutlet UIButton *buttonConstraints;

@end
