//
//  ProfileViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 06/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "ProfileViewController.h"
#import "DogListTableViewController.h"
#import "Dog.h"
#import "Profile.h"
#import "DogCollectionViewCell.h"
#import "ImagesCollectionViewCell.h"

@import FirebaseAuth;

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *lpgr
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.delegate = self;
    lpgr.delaysTouchesBegan = YES;
    [self.cv_photos addGestureRecognizer:lpgr];
    
    Dog *perro1 = [[Dog alloc]initWithName:@"Neus" andBreed:@"Mestiza" andAge:@"13" andImage:@"perro1" andKilometers:100.0];
    Dog *perro2 = [[Dog alloc]initWithName:@"Roc" andBreed:@"Pastor Alemán" andAge:@"3" andImage:@"perro2" andKilometers:100.0];
    Dog *perro3 = [[Dog alloc]initWithName:@"Luna" andBreed:@"Pastor Alemán" andAge:@"12" andImage:@"perro3" andKilometers:100.0];
    NSMutableArray* dogsArray = [[NSMutableArray alloc]initWithObjects:perro1,perro2,perro3,nil];
    NSMutableArray* images = [[NSMutableArray alloc]initWithObjects:@"perrotest1",@"perrotest2",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3", nil];
    Profile* profile = [[Profile alloc]initWithUsername:@"mcvarg" andName:@"Maria del Carmen Vargas Moreno" andImage:@"mariatest" andBackground:@"backgroundtest" andBiography:@"Hola soy la descripcion de Maria" andPhone:@"691271096" andGender:nil andDogs:dogsArray andImages:images];
    self.profile = profile;
    
    
    
    [self fillView];
    //  Test user loggeado actualmente
    NSLog(@"Usuario logeuado actu: %@",[FIRAuth auth].currentUser.email);
    
    //user defaults, hacer root a tab bar controller
    
    
    
    /*Codigo cambiar contraseña (para el edit profile view controller)
     [FIRAuth auth].currentUser updatePassword:<#(nonnull NSString *)#> completion:^(NSError * _Nullable error) {
     <#code#>
     }
     */
    
    self.iv_profile.layer.cornerRadius = self.iv_profile.frame.size.width / 2;
    self.iv_profile.clipsToBounds = YES;
    self.iv_profile.layer.borderColor = [UIColor whiteColor].CGColor;
    self.iv_profile.layer.borderWidth = 1;
    
    
    // ********************
    self.cv_dogs.dataSource = self;
    self.cv_dogs.delegate = self;
    self.cv_photos.delegate = self;
    self.cv_photos.dataSource = self;
    
    
}

-(void)handleLongPress:(UILongPressGestureRecognizer*)gestureRecognizer{
    
    CGPoint p = [gestureRecognizer locationInView:self.cv_photos];
    
    NSIndexPath *indexPath = [self.cv_photos indexPathForItemAtPoint:p];
    if(gestureRecognizer.state != UIGestureRecognizerStatePossible && gestureRecognizer.state != UIGestureRecognizerStateEnded){

        if (indexPath == nil){
            NSLog(@"couldn't find index path");
        } else {
            NSLog(@"LONG PRESS ITE: %li", (long)indexPath.row);
            // get the cell at indexPath (the one you long pressed)
            UICollectionViewCell* cell =
            [self.cv_photos cellForItemAtIndexPath:indexPath];
            // do stuff with the cell
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(collectionView == self.cv_dogs){
        return [self.profile.dogs count];
    }else{
        return [self.profile.images count];
    }
    
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == self.cv_dogs){
        static NSString *cellIdentifierDogs = @"dogsCell";
        DogCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifierDogs forIndexPath:indexPath];
        Dog* dog = self.profile.dogs[indexPath.row];
        cell.iv_dogs.image = [UIImage imageNamed:dog.image];
        return cell;
    }else{
        static NSString *cellIdentifier = @"imagesCell";
        ImagesCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.iv_image.image = [UIImage imageNamed:self.profile.images[indexPath.row]];
        return cell;
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == self.cv_dogs){
        return CGSizeMake(CGRectGetHeight(collectionView.frame), (CGRectGetHeight(collectionView.frame)));
    }else{
        return CGSizeMake(CGRectGetWidth(collectionView.frame)/3.05, (CGRectGetWidth(collectionView.frame)/3.05));
    }
}


#pragma UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (IBAction)guardar:(UIStoryboardSegue *)segue
{
    
}


- (IBAction)cancelar:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
    }
    
}
-(void)fillView{
    [self.iv_profile setImage:[UIImage imageNamed:self.profile.profileImage]];
    [self.iv_profileBackground setImage:[UIImage imageNamed:self.profile.background]];
    [self.l_username setText:self.profile.username];
    [self.l_name setText:self.profile.name];
}
- (IBAction)uploadImage:(id)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Upload an Image" message:@"Upload from:" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {

    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No camera found"
                                                                           message:@"This device does not have camera or is not working as expected."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;

        }
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
        pickerView.allowsEditing = YES;
        pickerView.delegate = self;
        [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:pickerView animated:YES completion:nil];
        
    }]];
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSURL* img = [info valueForKey:UIImagePickerControllerImageURL];
    NSString* selectedImagePath = [img path];
    
    [self.profile.images insertObject:selectedImagePath atIndex:0];
    [self.cv_photos reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDogs"]) {
        DogListTableViewController *dogsViewController = [segue destinationViewController];
        [dogsViewController setDogs:self.profile.dogs];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end