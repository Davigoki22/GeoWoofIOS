//
//  LoginViewController.h
//  GeoWoof
//
//  Created by alumno on 7/2/18.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf_username;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UIButton *btn_auth;
@property (weak, nonatomic) IBOutlet UIButton *btn_register;

@end
