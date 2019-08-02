//
//  ViewController.m
//  day6-internet-blocking
//
//  Created by Dave Henson on 7/29/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  NSString *myjson=  [self downloadInternetString:@"https://s3.amazonaws.com/certifiednetworks/classes/iphone/ucla201507/students.json"];
    NSLog(@"%@", myjson);
    
}

-(NSString *)downloadInternetString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
  
    NSLog(@"starting download...");
    NSString *result = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"download complete!");
    
    return result;
    
}

-(void)downloadInternetData:(NSString *) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [conn start];
}

@end
