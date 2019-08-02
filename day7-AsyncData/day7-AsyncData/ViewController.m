//
//  ViewController.m
//  day7-AsyncData
//
//  Created by Dave Henson on 8/5/15.

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    iv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:iv];
    
    AsyncData *data = [[AsyncData alloc] init];
    
    data.completionDataHandler=^(NSData *internetData){
        iv.image = [UIImage imageWithData:internetData];
    };
    
    [data startDownload:@"http://ucla201507.certifiednetworks.com/slowimage.php?sleeptime=8"];
    
    
}


@end
