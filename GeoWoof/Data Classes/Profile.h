//
//  Profile.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 06/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property NSString* background;
@property NSString* profileImage;
@property NSString* username;
@property NSString* name;
@property NSString* biography;
@property NSString* phone;
@property NSString* gender;
@property NSMutableArray* images;
@property NSMutableArray* dogs;

-(id)initWithUsername:(NSString*)username andName:(NSString*)name andImage:(NSString*)image andBackground:(NSString*)background andBiography:(NSString*)biography andPhone:(NSString*)phone andGender:(NSString*)gender andDogs:(NSMutableArray*)dogs andImages:(NSMutableArray*) images;

@end
