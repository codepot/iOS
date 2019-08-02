//
//  ViewController.m
//  day5-custom-view-gradient
//
//  Created by Dave Henson on 7/22/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [[MyGradentView alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 300.0)];
    //self.myView.image = [UIImage imageNamed:@"bottle.JPG"];
    [self.view addSubview:self.myView];
}



@end
