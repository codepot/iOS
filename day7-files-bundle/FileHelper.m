//
//  FileHelper.m
//  day7-files-bundle
//
//  Created by Dave Henson on 8/5/15.

#import "FileHelper.h"

@implementation FileHelper


+(NSString *)BundleDirectory
{
    NSBundle *myBundle = [NSBundle mainBundle];
    NSString *myBundlePath = [myBundle bundlePath];
    return myBundlePath;
}



+(NSString *)DocsDirectory
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
   // NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
   // return basePath;
    
    return [paths objectAtIndex:0];
}

@end
