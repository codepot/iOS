//
//  AppDelegate.m
//  day4-tab-with-nav
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = [UIColor darkGrayColor];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //rootviewcontroller
    
    self.TabVC = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    
    
    self.navRootVC = [[MyTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.navRootVC.title = @"Nav";

    self.navVC = [[UINavigationController alloc] initWithRootViewController:self.navRootVC];
    self.navRootVC.view.backgroundColor = [UIColor whiteColor];
    
    self.tab2VC = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    self.tab2VC.title = @"Tab2VC";
    self.tab2VC.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Metal.png"]];
   
    self.webVC = [[WebViewController alloc] initWithNibName:nil bundle:nil];
    self.webVC.title = @"WebVC";
    
    self.TabVC.viewControllers = [NSArray
                                  arrayWithObjects:self.navVC,
                                  self.tab2VC,
                                  self.webVC,
                                  nil];
    
    self.window.rootViewController = self.TabVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
