//
//  EggTimerViewController.m
//  day3-custom-delegate

#import "EggTimerViewController.h"


@implementation EggTimerViewController



-(void)tick
{
    NSLog(@"tick");
    currentSeconds ++;
    
    timerView.transform = CGAffineTransformMakeTranslation(0.0, currentSeconds * 10.0);
    
    if(currentSeconds >= self.maxSeconds)
    {
        NSLog(@"done");
        [self stopTimer];
        [self.delegate timerFinished:self];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.view.clipsToBounds = YES;
    
    timerView = [[UIView alloc] initWithFrame:CGRectZero];
    timerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:timerView];
}

-(void)viewWillAppear:(BOOL)animated
{
    timerView.frame = self.view.bounds;
}

-(void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
   
}

-(void)stopTimer
{
    //nsnotifcation fire....
    
    [timer invalidate];
}


@end
