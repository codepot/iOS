//
//  Car.h
//  day2-warmup
//
//  Created by Dave Henson on 7/1/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    //ivars
    double cost;
    NSString *make;
    NSString *myModel;
    
}

//properties

@property() NSString *model;

//methods
- (instancetype)initWithMake:(NSString *)theMake;


@end
