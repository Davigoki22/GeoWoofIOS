//
//  Dog.h
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 06/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property NSString* image;
@property NSString* name;
@property NSString* breed;
@property NSString* age;
@property float kilometers;

-(id)initWithName:(NSString*)name andBreed:(NSString*)breed andAge:(NSString*)age andImage:(NSString*)image andKilometers:(float)kilometers;

@end
