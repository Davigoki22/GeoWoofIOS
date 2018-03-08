//
//  Profile.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 06/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(id) initWithUsername:(NSString*)username andName:(NSString*)name andImage:(NSString*)image andBackground:(NSString*)background andBiography:(NSString*)biography andPhone:(NSString*)phone andGender:(NSString*)gender andDogs:(NSMutableArray*)dogs andImages:(NSMutableArray*) images{
    self = [super init];
    
    if(self){
        self.background = background;
        self.username = username;
        self.name = name;
        self.profileImage = image;
        self.biography = biography;
        self.phone = phone;
        self.gender = gender;
        self.dogs = dogs;
        self.images = images;
    }
    return self;
}

@end
