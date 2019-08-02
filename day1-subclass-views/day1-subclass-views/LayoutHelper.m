//
//  LayoutHelper.m
//  day1-subclass-views
//
//  Created by Dave Henson on 6/24/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "LayoutHelper.h"

@implementation LayoutHelper

+(CGRect)frameForLabel
{

    CGRect frame = CGRectMake(10.0, 30.0, 230.0, 44.0);
    
    return frame;
}
+(CGRect)frameForWebView
{
    CGRect frame = CGRectMake(10.0, 460.0, 200.0, 250.0);
    
    return frame;
}
+(CGRect)frameForImageView
{
    CGRect frame = CGRectMake(10.0, 60.0, 200.0, 250.0);
    
    return frame;
}

@end
