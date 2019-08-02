//
//  ViewController.h
//  day9-core-motion
//
//  Created by Dave Henson on 6/3/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
{
    UIAccelerometer *accel;
    
    CMMotionManager *motionManager;
    
    
}

@end

