//
//  ViewController.m
//  day3-custom-delegate
//
//  Created by Dave Henson on 7/8/15.

#import "ViewController.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    eggTimerVC = [[EggTimerViewController alloc] init];
    eggTimerVC.view.frame = CGRectMake(10.0, 120.0, 100.0, 100.0);
    //eggTimerVC.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:eggTimerVC.view];
    
    eggTimerVC.maxSeconds = 4;
    eggTimerVC.delegate = self;
    
    [eggTimerVC startTimer];
    
    
    eggTimerVC2 = [[EggTimerViewController alloc] init];
    eggTimerVC2.view.frame = CGRectMake(100.0, 520.0, 100.0, 100.0);
   // eggTimerVC2.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:eggTimerVC2.view];
    
    eggTimerVC2.maxSeconds = 6;
    eggTimerVC2.delegate = self;
    
    [eggTimerVC2 startTimer];
    
    
    
}

-(void)timerFinished:(EggTimerViewController *)theTimerVC
{
    if([theTimerVC isEqual:eggTimerVC])
    {
        [UIView animateWithDuration:1.0 animations:^{
            eggTimerVC.view.alpha = 0;
        }];
    }
    
    if([theTimerVC isEqual:eggTimerVC2])
    {
        [UIView animateWithDuration:1.0 animations:^{
            eggTimerVC2.view.alpha = 0;
        }];
    }
    
}

@end
