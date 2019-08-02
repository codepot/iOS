//
//  Car.m
//  day2-warmup
//
//  Created by Dave Henson on 7/1/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)setModel:(NSString *)model
{
    //business logic...
    if([model isEqualToString:@"red nissan sentra"])
    {
        myModel = nil;
        return;
    }
    
    myModel = model;
    
}

-(NSString *)model
{
    return myModel;
}

- (instancetype)init
{

    return nil;
}

- (instancetype)initWithMake:(NSString *)theMake
{
    self = [super init];
    if (self)
    {
       //anything here that makes this a valid object...
        make = theMake;
    }
    return self;
}

@end
