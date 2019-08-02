//
//  ViewController.m
//  day6-internet-files
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
    [self downloadInternetImage];
}


-(void)downloadInternetImage
{
    NSString *urlString=@"http://cdn.certifiednetworks.com/images/certified-networks-header.png";
    NSString *wallPaper = @"http://www.wallpaperup.com/uploads/wallpapers/2013/08/20/136289/ca65f791b4455de917122a8b13f945a3.jpg";
    
    [self downloadInternetData:wallPaper];
    
}


-(void)downloadInternetData:(NSString *) urlString
{
    //NSString *urlString = @"http://www.certifiednetworks.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    /*
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"GET"];
    */
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [conn start];
}


#pragma mark - NSURLConnectionDelegate


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.myData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%@", data);
    
    [self.myData appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   // NSString *htmlString = [[NSString alloc] initWithData:self.myData encoding:NSUTF8StringEncoding];
    
    UIImage *img = [UIImage imageWithData:self.myData];
    
    NSLog(@"%@", img);
}
@end
