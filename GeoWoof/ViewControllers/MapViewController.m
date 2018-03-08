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
    CLLocationDistance distancia;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createWalkbutton];

    // Do any additional setup after loading the view.
}
-(void)createWalkbutton{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(startWalk) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"Start walk" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(16, 287, 288, 30);
    self.button.layer.borderColor = [UIColor blackColor].CGColor;
    self.button.layer.borderWidth = 0.3;
    self.button.layer.cornerRadius = 14.0;
    [self.button setTitleColor:[UIColor colorWithRed:0.99 green:0.18 blue:0.33 alpha:1.0] forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor whiteColor]];
    [self.button setShowsTouchWhenHighlighted:YES];
    [self.view addSubview:self.button];
    
    //Constraints
    /*NSDictionary * buttonDic = NSDictionaryOfVariableBindings(self.button);
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray * hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:buttonDic];
    [self.view addConstraints:hConstraints];*/

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
    
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    CLLocationCoordinate2D circleCenter = CLLocationCoordinate2DMake(-33.86, 151.20);
    radioVisible = [GMSCircle circleWithPosition:circleCenter
                                          radius:400];
    
    radioVisible.map = mapView;



}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation * location = [locations lastObject];
    GMSCameraPosition * cpActual = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude zoom:15];
    [mapView animateWithCameraUpdate:[GMSCameraUpdate zoomIn]];
    [mapView animateToCameraPosition:cpActual];
    [mapView setMinZoom:10 maxZoom:15];
    [radioVisible setPosition:location.coordinate];
    [path addCoordinate:location.coordinate];
    ruta = [GMSPolyline polylineWithPath:path];
    ruta.map = mapView;
    ruta.strokeColor= [UIColor colorWithRed:0.99 green:0.18 blue:0.33 alpha:1.0];
    if([locations count] < 3){
    }else{
        //distancia += [locations[0] distanceFromLocation:locations[2]];
    }
    
    //NSLog(@"Distancia recorrida: %f",distancia);
    [laRuta addObject:location];
    
}

-(void)startWalk{
    CLLocationDistance dist = 0;
    if([laRuta count]>2){
        for(int i = 0;i<([laRuta count]-1);i++){
            dist += [laRuta[i+1] distanceFromLocation:laRuta[i]];
        }
    }
    
    NSLog(@"DISTANCIA RECORRIDA: %f",dist);
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
