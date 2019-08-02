//
//  AppDelegate.h
//  day4-view-controllers
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyViewController *vc;
@property (strong, nonatomic) MyViewController *vc2;

@property (strong, nonatomic) UITabBarController *tabVC;


@end

