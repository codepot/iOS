//
//  ViewController.m
//  day7-files-bundle
//
//  Created by Dave Henson on 8/5/15.


#import "ViewController.h"
#import "FileHelper.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *bundleDirectory=[FileHelper BundleDirectory];
    NSLog(@"Bundle: %@", bundleDirectory);
    
    NSString *docsDirectory = [FileHelper DocsDirectory];
    NSLog(@"Docs: %@", docsDirectory);
    
    
}


@end
