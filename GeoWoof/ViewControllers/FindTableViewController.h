//
//  FindTableViewController.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Profile;

@interface FindTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property Profile* profile;
@property NSMutableArray* profiles;
@property (weak, nonatomic) IBOutlet UISearchBar *sb_search;



@end
