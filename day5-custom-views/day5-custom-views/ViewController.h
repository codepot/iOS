//
//  ViewController.h
//  day5-custom-views
//
//  Created by Dave Henson on 7/22/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
#import "MyView.h"


@interface ViewController : UIViewController
{
    CGFloat angle;
}

@property(nonatomic, strong) UIView *greenView;

@property(nonatomic, strong) UIView *myView;
@property(nonatomic, strong) MyView *myOtherView;

@end