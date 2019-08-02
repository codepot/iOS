//
//  ViewController.m
//  day7-async
//
//  Created by Dave Henson on 8/5/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    iv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:iv];
    
//    [self downloadInternetImage];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshRexImage) name:@"rexIsHere" object:nil];
    
    DataCache *cache =[DataCache sharedData];
    [cache loadRexImageInBackground];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    NSArray *items = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];

    [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *item = (NSString *)obj;
        NSLog(@"%@", item);
    }];
    
    for (NSString *s in items) {
        NSLog(@"%@", s);
    }
    
    [UIView animateWithDuration:2.8 animations:^(void){
        iv.frame = CGRectMake(100.0, 100.0, 200.0, 200.0);
    }];
    
}

-(void)refreshRexImage
{
    DataCache *cache = [DataCache sharedData];
    iv.image = cache.rexImage;
}


-(void)downloadInternetImage
{
    
    DataCache *cache = [DataCache sharedData];
    
    iv.image = [cache rexImage];
  
}


@end
