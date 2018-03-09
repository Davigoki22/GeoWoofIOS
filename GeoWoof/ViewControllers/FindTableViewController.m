//
//  FindTableViewController.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 15/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "FindTableViewController.h"
#import "ProfileCell.h"
#import "Profile.h"
#import "Dog.h"
#import "WatchProfileViewController.h"

@interface FindTableViewController (){
    NSMutableArray* filteredProfiles;
    BOOL isFiltered;
    NSArray* scopeTitle;
}
    
@end

@implementation FindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered = false;
    self.sb_search.delegate = self;
    self.tableView.dataSource = self;
    [self initializeProfile];
    [self setScopeBarTitlesForDogsBreed];
    [self initializeProfilesToSearch];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)resignFirstResponder{
    return [self.sb_search becomeFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self filterListBySearchText:searchBar andSelectedScope:searchBar.selectedScopeButtonIndex];
}
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self filterListBySearchText:searchBar andSelectedScope:selectedScope];
}

-(void)filterListBySearchText:(UISearchBar*)searchBar andSelectedScope:(NSInteger)selectedScope{
    if(searchBar.text.length  == 0){
        isFiltered = false;
    }else{
        isFiltered = true;
        filteredProfiles = [[NSMutableArray alloc]init];
        if(self.sb_search.selectedScopeButtonIndex == 0){
            for (Profile* profile in self.profiles) {
                NSRange nameRange = [profile.username rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
                if(nameRange.location != NSNotFound){
                    [filteredProfiles addObject:profile];
                }
            }
            
        }else{
            for (Profile* profile in self.profiles) {
                NSRange nameRange = [profile.username rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
                for (Dog* dog in profile.dogs) {
                    NSRange dogRange = [dog.breed rangeOfString:self.sb_search.scopeButtonTitles[self.sb_search.selectedScopeButtonIndex] options:NSCaseInsensitiveSearch];
                    if(nameRange.location != NSNotFound && dogRange.location != NSNotFound){
                        [filteredProfiles addObject:profile];
                    }
                }
                
            }
        }
        
        
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(isFiltered){
        return filteredProfiles.count;
    }
    return [self.profiles count];
}

- (ProfileCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *CellIdentifier = @"profileCell";
        ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if(isFiltered){
            Profile* profileAtIndex = [filteredProfiles objectAtIndex:indexPath.row];
            [[cell l_name] setText:profileAtIndex.name];
            [[cell l_username] setText:profileAtIndex.username];
            [[cell iv_profile] setImage:[UIImage imageNamed:profileAtIndex.profileImage]];
        }else{
            Profile* profileAtIndex = [self.profiles objectAtIndex:indexPath.row];
            [[cell l_name] setText:profileAtIndex.name];
            [[cell l_username] setText:profileAtIndex.username];
            [[cell iv_profile] setImage:[UIImage imageNamed:profileAtIndex.profileImage]];
        }
        return cell;
    
    
    
}
-(void)setScopeBarTitlesForDogsBreed{
    int isEqual = 0;
    NSMutableArray* scopeTitles = [[NSMutableArray alloc]initWithObjects:@"All", nil];
    for (Dog* dog in self.profile.dogs) {
        isEqual = 0;
        for (int i=0;i<scopeTitles.count;i++) {
            if([dog.breed isEqualToString:[scopeTitles objectAtIndex:i]]){
                isEqual++;
            }
        }
        if(isEqual == 0)
            [scopeTitles addObject:dog.breed];
    }
    self.sb_search.scopeButtonTitles = scopeTitles;
    
}

//metodos carga datos
-(void)initializeProfile{
    Dog *perro1 = [[Dog alloc]initWithName:@"Neus" andBreed:@"Mestiza" andAge:@"13" andImage:@"perro1" andKilometers:100.0];
    Dog *perro2 = [[Dog alloc]initWithName:@"Roc" andBreed:@"Pastor Alemán" andAge:@"3" andImage:@"perro2" andKilometers:100.0];
    Dog *perro3 = [[Dog alloc]initWithName:@"Luna" andBreed:@"Pastor Alemán" andAge:@"12" andImage:@"perro3" andKilometers:100.0];
    NSMutableArray* dogsArray = [[NSMutableArray alloc]initWithObjects:perro1,perro2,perro3,nil];
    NSMutableArray* images = [[NSMutableArray alloc]initWithObjects:@"perrotest1",@"perrotest2",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3",@"perrotest3", nil];
    Profile* profile = [[Profile alloc]initWithUsername:@"mcvarg" andName:@"Maria del Carmen Vargas Moreno" andImage:@"mariatest" andBackground:@"backgroundtest" andBiography:@"Hola soy la descripcion de Maria" andPhone:@"691271096" andGender:nil andDogs:dogsArray andImages:images];
    self.profile = profile;
}

-(void)initializeProfilesToSearch{
    Dog *perro1 = [[Dog alloc]initWithName:@"Neus" andBreed:@"Mestiza" andAge:@"13" andImage:@"perro1" andKilometers:100.0];
    NSMutableArray* dogsArray1 = [[NSMutableArray alloc]initWithObjects:perro1,nil];
    

    Dog *perro2 = [[Dog alloc]initWithName:@"Luna" andBreed:@"Pastor Alemán" andAge:@"12" andImage:@"perro3" andKilometers:100.0];
    NSMutableArray* dogsArray2 = [[NSMutableArray alloc]initWithObjects:perro2,nil];

    Dog *perro3 = [[Dog alloc]initWithName:@"Roc" andBreed:@"Bulldog" andAge:@"12" andImage:@"perro2" andKilometers:100.0];
    NSMutableArray* dogsArray3 = [[NSMutableArray alloc]initWithObjects:perro3,nil];
    
    
    Profile* profile1 = [[Profile alloc]initWithUsername:@"davigoki" andName:@"David Barbé Losada" andImage:@"davidtest" andBackground:@"backgroundtest" andBiography:@"Hola soy la biografia de david" andPhone:@"691271096" andGender:nil andDogs:dogsArray1 andImages:nil];
    Profile* profile2 = [[Profile alloc]initWithUsername:@"eric" andName:@"Eric Garcia Rodriguez" andImage:@"perrotest1" andBackground:@"backgroundtest" andBiography:@"Hola soy la biografia de david" andPhone:@"691271096" andGender:nil andDogs:dogsArray2 andImages:nil];
    Profile* profile3 = [[Profile alloc]initWithUsername:@"ainoa" andName:@"Ainoa Apellido yOtroApellido" andImage:@"perrotest2" andBackground:@"backgroundtest" andBiography:@"Hola soy la biografia de david" andPhone:@"691271096" andGender:nil andDogs:dogsArray3 andImages:nil];
    
    self.profiles = [[NSMutableArray alloc]initWithObjects:profile1,profile2,profile3, nil];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"findProfileSelected"]) {
        if(isFiltered){
            WatchProfileViewController *ViewController = [segue destinationViewController];
            [ViewController setProfile:filteredProfiles[[self.tableView indexPathForSelectedRow].row]];
        }else{
            WatchProfileViewController *ViewController = [segue destinationViewController];
            [ViewController setProfile:self.profiles[[self.tableView indexPathForSelectedRow].row]];
        }
        
    }
}


@end
