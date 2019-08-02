//
//  ViewController.m
//  day5-custom-views
//
//  Created by Dave Henson on 7/22/15.

#import "ViewController.h"


@implementation ViewController

-(void)tick
{
    angle += .01;
    
    CALayer *myLayer = self.myView.layer;
    
    myLayer.transform = CATransform3DMakeRotation(angle, 0.5, 1.0, sin(angle));
    
    CGPoint oldCenter = self.greenView.center;
    CGPoint newCenter = CGPointMake(oldCenter.x+1, oldCenter.y);
    self.greenView.center = newCenter;
    
}

-(void)setupGreenView
{
    self.greenView = [[UIView alloc] initWithFrame:CGRectMake(-500.0, 40.0, 100.0, 100.0)];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
}


-(void)setupMyCustomView
{
    self.myOtherView = [[MyView alloc] initWithFrame:CGRectMake(20.0, 20.0, 200.0, 300.0)];
    self.myOtherView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.myOtherView];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View Will Appear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMyCustomView];
    
    [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.myView = [[UIView alloc] initWithFrame:CGRectInset(self.view.bounds, 30.0, 30.0)];
    self.myView.backgroundColor = [UIColor lightGrayColor];
    
    CALayer *myLayer = self.myView.layer;
    
    myLayer.cornerRadius = 20.0;
    myLayer.shadowColor = [UIColor blackColor].CGColor;
    myLayer.shadowOffset = CGSizeMake(10.0, 10.0);
    myLayer.shadowOpacity = 1.0;
    
    myLayer.transform = CATransform3DMakeRotation(.6, 1.0, 0.0, 0.0);
    
    CALayer *redLayer = [[CALayer alloc] init];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.frame = CGRectInset(myLayer.bounds, 20.0, -20.0);
    [myLayer addSublayer:redLayer];
    
    
    [self.view addSubview:self.myView];
    
    [self setupGreenView];
    
    
}


@end
