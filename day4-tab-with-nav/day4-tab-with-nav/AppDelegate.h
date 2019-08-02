//
//  AppDelegate.h
//  day4-tab-with-nav
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "MyTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *TabVC;

@property (strong, nonatomic) UINavigationController *navVC;
@property (strong, nonatomic) MyTableViewController *navRootVC;

@property (strong, nonatomic) UIViewController *tab2VC;
@property (strong, nonatomic) WebViewController *webVC;




@end

