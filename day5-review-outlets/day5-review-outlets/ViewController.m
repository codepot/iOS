//
//  ViewController.m
//  day5-review-outlets
//
//  Created by Dave Henson on 7/22/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *MyButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myLabel.text = @"hello from code!";
}

-(IBAction)myButtonClick
{
    NSLog(@"clicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
