//
//  ViewController.m
//  day9-instruments-demo
//
//  Created by Dave Henson on 6/3/15.

#import "ViewController.h"


@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    
    CGRect frame = CGRectMake(0, 0, 100, 100);
    
    ///[redView release];
    
    
    redView = [[UIView alloc] initWithFrame:frame];
    redView.center = touchPoint;
    redView.backgroundColor = [UIColor redColor];
    
    [items addObject:redView];
    
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:redView.bounds];
    iv.image = [UIImage imageNamed:@"doxy.jpg"];
    [redView addSubview:iv];
    
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, redView.bounds.size.width - 10, redView.bounds.size.height - 10)];
    blackView.backgroundColor = [UIColor blackColor];
 //   [redView addSubview:blackView];
    
    [self.view addSubview:redView];
    
    
    UILabel *label1 = nil;
    label1.accessibilityLabel = @"MyLabel";
}


-(void)someMethod:(NSString *)someParam
{
    NSLog(@"%@", someParam);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
}



@end
