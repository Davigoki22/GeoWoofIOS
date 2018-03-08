//
//  TourAppPageViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 08/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "TourAppPageViewController.h"
#import "TourViewController.h"

@interface TourAppPageViewController (){
    NSArray* devices;
}

@end

@implementation TourAppPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    devices = @[@"A",@"B",@"C",@"D"];
    self.dataSource = self;
    
    TourViewController*  initialVC = (TourViewController*)[self viewControllerAtIndex:0];
    NSArray* viewControllers = [NSArray arrayWithObject:initialVC];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Helper method
-(UIViewController*)viewControllerAtIndex:(NSUInteger)index{
    TourViewController* viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TourViewController"];
    viewController.str_image = devices[index];
    viewController.pageIndex = index;
    
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = ((TourViewController*) viewController).pageIndex;
    if(index == 0 || index == NSNotFound){
        return nil;
    }
    index--;
    NSLog(@"%lu",(unsigned long)index);
    return [self viewControllerAtIndex:index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = ((TourViewController*) viewController).pageIndex;
    if(index == NSNotFound || index == devices.count){
        return nil;
    }

    index++;
    NSLog(@"%lu",(unsigned long)index);
    return [self viewControllerAtIndex:index];
}



@end
