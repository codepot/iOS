//
//  MyViewController.m
//  day4-view-controllers
//
//  Created by Dave Henson on 7/15/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property() UIView *redView;
@end

@implementation MyViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.view.frame = CGRectMake(40.0, 40.0, 300.0, 300.0);
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil  bundle:nibBundleOrNil];
    if (self) {
        //
        //_redView = nil;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.redView.transform = CGAffineTransformMakeTranslation(-1000.0, self.redView.frame.origin.y);

}

-(void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:1.2 animations:^{
        self.redView.transform = CGAffineTransformIdentity;
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect myFrame = CGRectInset(self.view.bounds, 20.0, 20.0);
    self.redView = [[UIView alloc] initWithFrame:myFrame];
    self.redView.backgroundColor= [UIColor whiteColor];
    [self.view addSubview:self.redView];
    
    self.redView.transform = CGAffineTransformMakeTranslation(-1000.0, self.redView.frame.origin.y);
    
    
}

@end
