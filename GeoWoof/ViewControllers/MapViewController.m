//
//  MapViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 27/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController (){
    CLLocationManager * locationManager;
    GMSMapView *mapView;
    GMSCircle *radioVisible;
    GMSMutablePath *path;
    GMSPolyline *ruta;
    NSMutableArray* laRuta;
    Boolean walking;
    CLLocationDistance distancia;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    walking = false;
   
    self.navigationItem.title = @"Home";
    // Do any additional setup after loading the view.
}
-(void)createWalkbutton{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(startWalk) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"Start walk" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(45, 500, 288, 50);
    self.button.layer.borderColor = [UIColor grayColor].CGColor;
    self.button.layer.borderWidth = 1.0;
    self.button.layer.cornerRadius = 14.0;
    [self.button setTitleColor:[UIColor colorWithRed:0.99 green:0.18 blue:0.33 alpha:1.0] forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor whiteColor]];
    [self.button setShowsTouchWhenHighlighted:YES];
    
    
    
    /*NSLayoutConstraint *centreHorizontallyConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.button
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                        attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                        constant:0];
    
    [self.view addConstraint:centreHorizontallyConstraint];*/
    //Constraints
    /*NSDictionary * buttonDic = NSDictionaryOfVariableBindings(_button);
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray * hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_button]-0-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:buttonDic];
    [self.button addConstraints:hConstraints];*/

}
-(void)addWalkButton{
    [self.view addSubview:self.button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadView {
    laRuta = [[NSMutableArray alloc]init];
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    path = [GMSMutablePath path];
    
    ruta = [GMSPolyline polylineWithPath:path];
    
    if([CLLocationManager locationServicesEnabled] == NO){
        NSLog(@"Your location service is not enabled, So go to Settings > Location Services");
    }
    else{
        NSLog(@"Your location service is enabled");
    }
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    mapView.settings.myLocationButton = YES;
    [self createWalkbutton];
    self.view = mapView;
    
    [self addWalkButton];
    
    // Creates a marker in the center of the map.
    /*CLLocationCoordinate2D circleCenter = CLLocationCoordinate2DMake(-33.86, 151.20);
    radioVisible = [GMSCircle circleWithPosition:circleCenter
                                          radius:400];
    
    radioVisible.map = mapView;*/



}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    if(walking){
        NSLog(@"update location");
        CLLocation * location = [locations lastObject];
        GMSCameraPosition * cpActual = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude zoom:70];
        [mapView animateWithCameraUpdate:[GMSCameraUpdate zoomIn]];
        [mapView animateToCameraPosition:cpActual];
        [mapView setMinZoom:0 maxZoom:15];
        [radioVisible setPosition:location.coordinate];
        [path addCoordinate:location.coordinate];
        ruta = [GMSPolyline polylineWithPath:path];
        ruta.map = mapView;
        ruta.strokeColor= [UIColor colorWithRed:0.99 green:0.18 blue:0.33 alpha:1.0];
        if([locations count] < 3){
        }else{
            distancia += [locations[0] distanceFromLocation:locations[2]];
        }
        
        //NSLog(@"Distancia recorrida: %f",distancia);
        [laRuta addObject:location];
    }
    
}
-(void)showAlertWalkedWithDistance:(CLLocationDistance)distance{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You have walked:"
                                                                   message:[NSString stringWithFormat:@"%f Meters!",distance]
                                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Nice!" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {}];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)startWalk{
    if(!walking){
        walking = true;
        NSLog(@"false walking");
        [self.button setTitle:@"End Walk" forState:UIControlStateNormal];
    }else{
        walking = false;
        NSLog(@"true walk");
        [self.button setTitle:@"Start Walk" forState:UIControlStateNormal];
        [self showAlertWalkedWithDistance:[self calculateDistanceWalked]];
    }
    
}
-(CLLocationDistance)calculateDistanceWalked{
    CLLocationDistance dist = 0;
    if([laRuta count]>2){
        for(int i = 0;i<([laRuta count]-1);i++){
            dist += [laRuta[i+1] distanceFromLocation:laRuta[i]];
        }
    }
    return dist;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
