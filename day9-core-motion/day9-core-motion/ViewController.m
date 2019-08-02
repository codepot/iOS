//
//  ViewController.m
//  day9-core-motion
//
//  Created by Dave Henson on 6/3/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = .5;
    motionManager

}


@end
