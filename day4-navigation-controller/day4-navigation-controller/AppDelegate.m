//
//  AppDelegate.m
//  day4-navigation-controller
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
    
    self.navVC = [[UINavigationController alloc] initWithRootViewController:self.vc];
    
    
    self.window.rootViewController = self.navVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
