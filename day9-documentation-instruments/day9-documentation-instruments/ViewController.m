//
//  ViewController.m
//  day9-documentation-instruments
//
//  Created by Dave Henson on 8/19/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *s = [[Student alloc] init];
    [s sendAnEmail];
    
}

- (void)addAView
{
    
    //CGFloat randomX = ((CGFloat)arc4random() / 300);
    //CGFloat randomY = ((CGFloat)arc4random() / 500);
    
    CGFloat randomX = ((CGFloat)rand() / RAND_MAX) * 300;
    CGFloat randomY = ((CGFloat)rand() / RAND_MAX) * 500;
    
    
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(randomX, randomY, 100.0 , 100.0)];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectInset(blackView.bounds, 10.0, 10.0)];
    redView.backgroundColor = [UIColor redColor];
    [blackView addSubview:redView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(int count = 0; count < 10000; count++)
    {
        [self addAView];

    }
    
}

@end
