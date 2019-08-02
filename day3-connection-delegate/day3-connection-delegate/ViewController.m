//
//  ViewController.m
//  day3-connection-delegate
//
//  Created by Dave Henson on 7/8/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMyViews];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   // [self downloadInternetData];
    [self downloadInternetDataWithDelegate];
}

-(void)setupMyViews
{
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    CGRect fullScreen = [UIScreen mainScreen].bounds;
    CGRect textRect = CGRectInset(fullScreen, 30.0, 30.0);
                         
    textView = [[UITextView alloc] initWithFrame:textRect];
    [self.view addSubview:textView];
    textView.text = @"this is a test of the emergency operating system.  do not turn off your tv set";
    textView.font = [UIFont systemFontOfSize:32.0];
    
}

#pragma mark - Touch Events

-(void)downloadInternetData
{
    NSString *urlString = @"https://www.gutenberg.org/files/2701/2701-h/2701-h.htm";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSString *internetText = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    textView.text = internetText;
    
}

-(void)downloadInternetDataWithDelegate
{
    NSString *urlString = @"https://www.gutenberg.org/files/2701/2701-h/2701-h.htm";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}


#pragma mark - Internet Stuff

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    myData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [myData appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *result = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    textView.text = result;
}




@end
