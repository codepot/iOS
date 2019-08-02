//
//  UCLAViewController.m
//  ArduinoClient
//
//  Created by Dave Henson on 12/12/12.


#import "UCLAViewController.h"

@implementation UCLAViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"on");
    [self ledOn];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self ledOff];
}


-(void)ledOn
{
    [duino sendMessage:@"blOn"];
}


-(void)ledOff
{
    [duino sendMessage:@"bOff"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    duino = [[ArduinoClient alloc] init];
    
}





@end
