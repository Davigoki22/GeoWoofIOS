//
//  LoginViewController.m
//  GeoWoof
//
//  Created by alumno on 7/2/18.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "LoginViewController.h"
@import FirebaseAuth;
@import Firebase;

@interface LoginViewController (){
    BOOL isLogIn;
}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isLogIn = YES;
    
    self.tf_username.delegate = self;
    self.tf_password.delegate = self;

    
    [self.tf_username setBackgroundColor:[UIColor clearColor]];
    [self.tf_password setBackgroundColor:[UIColor clearColor]];
    self.tf_username.layer.borderColor = [UIColor whiteColor].CGColor;
    self.tf_username.layer.borderWidth = 0.3;
    self.tf_password.layer.borderWidth = 0.3;
    self.tf_password.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.tf_username.layer.cornerRadius = 14.0;
    self.tf_password.layer.cornerRadius = 14.0;
    
    self.btn_auth.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btn_auth.layer.borderWidth = 0.3;
    //self.btn_auth.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.btn_auth.layer.cornerRadius = 14.0;
    
    // Do any additional setup after loading the view.
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticate:(id)sender {
    if(isLogIn){
        [[FIRAuth auth] signInWithEmail:_tf_username.text
                               password:_tf_password.text
                             completion:^(FIRUser *user, NSError *error) {
                                 NSLog(@"%@",user);
                                 if(user!=nil){
                                     [self dismissViewControllerAnimated:NO completion:nil];
                                     [self performSegueWithIdentifier:@"loginSuccesful" sender:self];
                                     NSLog(@"Usuario correcto");

                                 }else{
                                     NSLog(@"Error al loguear");
                                 }
                             }];
    }else{
        NSString* username = _tf_username.text;
        NSString* password = _tf_password.text;
        [[FIRAuth auth] createUserWithEmail:username
                                   password:password
                                 completion:^(FIRUser *_Nullable user, NSError *_Nullable error) {
                                     if(user!=nil){
                                         [self performSegueWithIdentifier:@"loginSuccesful" sender:self];
                                         NSLog(@"Usuario correcto");
                                     }else{
                                         NSLog(@"El usuario no se ha creado correctamente");
                                     }
                                 }];
    }
}

- (IBAction)registerLogIn:(id)sender {
    if(isLogIn){
        isLogIn = NO;
        [self.btn_auth setTitle:@"Register" forState:UIControlStateNormal];
        [self.btn_register setTitle:@"Log In" forState:UIControlStateNormal];
    }else{
        isLogIn = YES;
        [self.btn_auth setTitle:@"Log In" forState:UIControlStateNormal];
        [self.btn_register setTitle:@"Register" forState:UIControlStateNormal];
    }
}

- (IBAction)resetPassword:(id)sender {
    [[FIRAuth auth]sendPasswordResetWithEmail:_tf_username.text completion:^(NSError * _Nullable error) {
        if(error == nil){
            NSLog(@"Se ha enviado correctamente");
        }
    }];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
