//
//  ViewController.m
//  day1-subclass-views
//
//  Created by Dave Henson on 6/24/15.

#import "ViewController.h"


@implementation ViewController

-(void)tick
{
    angle +=.01;
    myLabel.transform = CGAffineTransformMakeRotation(angle);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupImageView];
    
    [self setupWebView];
    
    [self setupLabel];
    
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

-(void)setupWebView
{
    
    myWebView = [[UIWebView alloc] initWithFrame:[LayoutHelper frameForWebView]];
    [self.view addSubview:myWebView];
    
    NSString *urlString = @"http://www.certifiednetworks.com/classes/iphone";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:request];
    
}

-(void)setupImageView
{
    myImageView = [[UIImageView alloc] initWithFrame:[LayoutHelper frameForImageView]];
    myImageView.image = [UIImage imageNamed:@"doxy.jpg"];
    [self.view addSubview:myImageView];
}

-(void)setupLabel
{
    
    myLabel = [[UILabel alloc] initWithFrame:[LayoutHelper frameForLabel]];
    myLabel.text = @"Hello, World.";
    [self.view addSubview:myLabel];
    myLabel.font = [UIFont systemFontOfSize:34];
    myLabel.backgroundColor = [UIColor redColor];
}

@end
