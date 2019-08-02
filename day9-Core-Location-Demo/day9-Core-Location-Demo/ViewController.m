//
//  ViewController.m
//  day9-Core-Location-Demo
//
//  Created by Dave Henson on 8/19/15.

#import "ViewController.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCoreMotion];
}


-(void)setupCoreMotion
{
    self.manager = [[CMMotionManager alloc] init];
    self.manager.accelerometerUpdateInterval = .1;
    
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    
    [self.manager startAccelerometerUpdatesToQueue:myQueue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        float z = accelerometerData.acceleration.z;
        
        NSLog(@"x:%f y:%f z:%f", accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z);
        
        
        if(z > 1)
        {
            NSLog(@"oh no!");
        }
    }];
    
}
@end
