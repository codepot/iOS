//
//  MyViewController.m
//  day1-basics-nonib
//
//  Created by Dave Henson on 6/24/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "MyViewController.h"

@implementation MyViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.view.frame = CGRectMake(100, 100, 200, 200);
}


-(void)viewDidLoad
{
    redView = [[UIView alloc] initWithFrame:CGRectZero];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
}

-(void)viewWillAppear:(BOOL)animated
{
    redView.frame = CGRectMake(-500.0, -500.0, 200.0, 200.0);
    
}

-(void)viewDidAppear:(BOOL)animated
{
    CGRect fullScreen = [UIScreen mainScreen].bounds;
    CGFloat xCenter = fullScreen.size.width / 2.0;
    CGFloat yCenter = fullScreen.size.height / 2.0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.1];
    redView.center = CGPointMake(xCenter, yCenter);
    [UIView commitAnimations];
    
}


@end
