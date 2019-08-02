//
//  EggTimerViewController.h
//  day3-custom-delegate
//
//  Created by Dave Henson on 7/8/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EggTimerViewController; //forward reference - tell the compiler it will find out the class defininition later...


@protocol EggTimerProtocol <NSObject>

-(void)timerFinished:(EggTimerViewController *)theTimerVC;

@end


@interface EggTimerViewController : UIViewController
{
    NSTimer *timer;
    
    NSInteger currentSeconds;
    
    UIView *timerView;
    
}

@property() id<EggTimerProtocol> delegate;

@property(assign) NSInteger maxSeconds;

-(void)startTimer;
-(void)stopTimer;

@end
