//
//  WebViewController.m
//  day4-tab-with-nav
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property () UIWebView *webView;
@property () UIView *topView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView= [[UIWebView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.webView];
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 44.0)];
    self.topView.backgroundColor = [UIColor whiteColor];
    self.topView.alpha = .8;
    [self.view addSubview:self.topView];
    
    NSString *urlString = @"http://www.certifiednetworks.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}


-(void)viewDidAppear:(BOOL)animated
{
    self.webView.frame = self.view.bounds;
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

@end
