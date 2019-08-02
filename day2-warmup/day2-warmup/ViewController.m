//
//  ViewController.m
//  day2-warmup
//
//  Created by Dave Henson on 7/1/15.

#import "ViewController.h"


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // redView
    
    Car *myCar = [[Car alloc] init];
    if(myCar!=nil)
    {
        //myCar.ma
        
        //setter
        myCar.model = @"Model T";
        [myCar setModel:@"Model A"];
        
        
        
        
        //getter
        NSString *theModel = myCar.model;
        NSString *theOldSchoolModel = [myCar model];
        
 
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

@end
