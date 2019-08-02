//
//  ViewController.h
//  day3-custom-delegate
//
//  Created by Dave Henson on 7/8/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EggTimerViewController.h"

@interface ViewController : UIViewController<EggTimerProtocol>
{
    EggTimerViewController *eggTimerVC;
    EggTimerViewController *eggTimerVC2;
    
}

@end

