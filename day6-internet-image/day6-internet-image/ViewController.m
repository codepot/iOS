//
//  ViewController.m
//  day6-internet-image
//
//  Created by Dave Henson on 7/29/15.

#import "ViewController.h"


@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self downloadInternetImage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadInternetImage];
}



-(void)downloadInternetImage
{
    NSString *urlString = @"http://ucla201507.certifiednetworks.com/slowimage.php?sleeptime=14";
    NSData *imgData=  [self downloadInternetData:urlString];
    
    UIImage *rex = [UIImage imageWithData:imgData];
    self.MyImageView.image = rex;
}


-(NSData *)downloadInternetData:(NSString *) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *myData = [NSData dataWithContentsOfURL:url];
    
    return myData;
}

@end

