//
//  AppDelegate.m
//  day4-view-controllers
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //window
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = [UIColor darkGrayColor];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //rootviewcontroller
    
    self.vc = [[MyViewController alloc] initWithNibName:nil bundle:nil];
    self.vc.title = @"My VC1";
    self.vc.tabBarItem.image = [UIImage imageNamed:@"arrows.png"];
    
    self.vc2 = [[MyViewController alloc] initWithNibName:nil bundle:nil];
    self.vc2.title = @"My VC2";
    self.vc2.tabBarItem.image = [UIImage imageNamed:@"circle2.png"];
    
    self.tabVC = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    
    self.tabVC.viewControllers = [NSArray arrayWithObjects:self.vc, self.vc2, nil];
    
    
    self.window.rootViewController = self.tabVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
