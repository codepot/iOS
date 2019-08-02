//
//  AppDelegate.m
//  day1-basics-nonib
//
//  Created by Dave Henson on 6/24/15.

#import "AppDelegate.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    //setup window
    CGRect fullScreen = [UIScreen mainScreen].bounds;
    
    self.window = [[UIWindow alloc] initWithFrame:fullScreen];
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    //setup viewcontroller, add view
   self.vc = [[MyViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.vc;
    self.vc.view.backgroundColor = [UIColor darkGrayColor];
    
    //make app touchable
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
