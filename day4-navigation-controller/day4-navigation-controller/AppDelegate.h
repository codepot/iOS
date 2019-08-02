//
//  AppDelegate.h
//  day4-navigation-controller
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navVC;
@property (strong, nonatomic) MyViewController *vc;

@end

