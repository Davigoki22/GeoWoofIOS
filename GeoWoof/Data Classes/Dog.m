//
//  Dog.m
//  GeoWoof
//
//  Created by Eric Garcia Rodriguez on 06/02/2018.
//  Copyright © 2018 Eric Garcia Rodriguez. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(id)initWithName:(NSString*)name andBreed:(NSString*)breed andAge:(NSString*)age andImage:(NSString*)image andKilometers:(float)kilometers{
    self = [super init];
    
    if(self){
        self.image = image;
        self.name = name;
        self.breed = breed;
        self.age = age;
        self.kilometers = kilometers;

    }
    return self;
}

@end
