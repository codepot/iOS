

//  Homework5
//  Created by Phuc Le on 7/26/15.


#import "ViewController.h"
#import "BarGraphView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property () BarGraphView *graphView;
@property () UIButton *button;
@end
#define DEGREES_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.graphView = [[BarGraphView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 550.0)];
    self.graphView.clearsContextBeforeDrawing = YES;
    self.graphView.center = CGPointMake(540.0, 250.0);
    [self.view addSubview:self.graphView];
    self.view.backgroundColor = [UIColor blackColor];
    [self setupButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupButton{
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CALayer *layer = self.button.layer;
    layer.borderWidth = 1.5;
    layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    layer.cornerRadius = 10.0;
    self.button.clipsToBounds = YES;
    [self.button setTitle:@"Draw Graph Chart Again" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(100.0, 560.0, 240.0, 44.0);
    [self.button addTarget:self action:@selector(btnClicked)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    self.button.center = CGPointMake(self.view.center.x, 560.0);
    

    
}

-(void)btnClicked {
    [self.graphView removeFromSuperview];
    self.graphView = [[BarGraphView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 550.0)];

    self.graphView.clearsContextBeforeDrawing = YES;
    [self.view addSubview:self.graphView];
     self.graphView.center = CGPointMake(540.0, 250.0);
    [self.graphView setNeedsDisplay];
}
@end
