//
//  ViewController.m
//  day1-first-app
//
//  Created by Dave Henson on 6/24/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    redView.center = CGPointMake(300, 300);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    redView = [[UIView alloc] init];
    redView.frame = CGRectMake(20, 20, 100, 100);
    //redView.backgroundColor = [UIColor redColor];
    redView.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    [self.view addSubview:redView];

    UIView *blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(10, 10, 30, 30);
    blueView.backgroundColor = [UIColor blueColor];
    [redView addSubview:blueView];
    
    //s = [[Student alloc] init];
    s = [Student createANewStudent];
    
    [s sendAnEmail:@"hello"
              body:@"this is the body"
          priority:1
              from:@"dh@msn.com"
         recipient:@"joe@nowhere.com"];
    
}

@end