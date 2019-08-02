//
//  ViewController.m
//  day2-view-classes
//
//  Created by Dave Henson on 7/1/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupMyLabel];
    
    [self setupMyButton];
}


-(void)myButtonClick
{
    NSLog(@"button was clicked...");
    

}

-(void)setupMyButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 150, 144.0, 44.0);
    [button setTitle:@"Click Me" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    //target/action
    [button addTarget:self action:@selector(myButtonClick) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}


-(void)setupMyLabel
{
    ///tons of math on pixels..(points...)
    //CGRect fullScreen = [UIScreen mainScreen].bounds;
    
    
    NSLog(@"hello from objc code %@", self.view);
    
    
    
    CGRect labelFrame = CGRectMake(10.0, 50.0, 220.0, 22.0);
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:labelFrame];
    myLabel.text = @"Hello, World.";
    myLabel.font = [UIFont systemFontOfSize:22.0];
    myLabel.textColor = [UIColor redColor];
    
    myLabel.alpha = 1.0;
    myLabel.opaque = true;
    myLabel.transform = CGAffineTransformMakeRotation(.5);
    
    [self.view addSubview:myLabel];
    
}


@end
