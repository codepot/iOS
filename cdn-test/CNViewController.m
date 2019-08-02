//
//  CNViewController.m
//  cdn-test
//
//  Created by Dave Henson on 5/19/14.

#import "CNViewController.h"


@implementation CNViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        speedTests = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubviews];
}


-(void)setupSubviews
{
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    CGFloat edgeInset = 48.0;
    CGRect fullScreen = [[UIScreen mainScreen] bounds];
    
    //correct for older auto-rotate-transform UIWindow
    if(fullScreen.size.width < fullScreen.size.height)
    {
        fullScreen = CGRectMake(0, 0, fullScreen.size.height, fullScreen.size.width);
    }
    
    tv = [[UITextView alloc] initWithFrame:CGRectInset(fullScreen, edgeInset, edgeInset)];
    [self.view addSubview:tv];
    
    CGRect labelFrame = CGRectMake(5.0, 5.0, fullScreen.size.width, edgeInset);
    instructions = [[UILabel alloc] initWithFrame:labelFrame];
    instructions.textColor = [UIColor whiteColor];
    instructions.text = @"Touch the gray area to run a test";
    [self.view addSubview:instructions];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    tv.text = [tv.text stringByAppendingString:@"----------------------- \n"];
    tv.text = [tv.text stringByAppendingFormat:@"%@ \n",[[NSDate alloc] init]];
    tv.text = [tv.text stringByAppendingString:@"----------------------- \n"];
    
    
    [tv resignFirstResponder];
    
    SpeedTest *t1 = [[SpeedTest alloc] init];
    t1.url = [NSURL URLWithString:@"https://img.abcmouse.com/html5/abc/student_homepage/bt/box_learningpath.png"];
    t1.shortDescription = @"img.abcmouse.com https     ";
    t1.asyncImage = [[AsyncImage alloc] initWithUrl:[t1.url absoluteString] ];
    t1.asyncImage.Identity = 1;
    t1.asyncImage.shortDescription = @"img.abcmouse.com https     ";
    [t1.asyncImage downloadStringWithDelegate:self];
    
   // [speedTests addObject:t1];
    
   
    
    SpeedTest *t4 = [[SpeedTest alloc] init];
    t4.url = [NSURL URLWithString:@"http://img.abcmouse.com/html5/abc/student_homepage/bt/box_learningpath.png"];
    t4.shortDescription = @"img.abcmouse.com http      ";
    t4.asyncImage = [[AsyncImage alloc] initWithUrl:[t4.url absoluteString] ];
    t4.asyncImage.Identity = 4;
    t4.asyncImage.shortDescription = @"img.abcmouse.com http      ";
    [t4.asyncImage downloadStringWithDelegate:self];
    
   // [speedTests addObject:t4];
    
   
    
    
    SpeedTest *t2 = [[SpeedTest alloc] init];
    t2.url = [NSURL URLWithString:@"http://7c4d2e95495f5f00412e-4c4ed84c4c125d6c6d326fcac33451ba.r2.cf1.rackcdn.com/box_learningpath.png"];
    t2.shortDescription = @"CDN rackspace (akamai)     ";
    t2.asyncImage = [[AsyncImage alloc] initWithUrl:[t2.url absoluteString] ];
    t2.asyncImage.Identity = 2;
    t2.asyncImage.shortDescription = @"CDN rackspace (akamai)     ";
    [t2.asyncImage downloadStringWithDelegate:self];
   // [speedTests addObject:t2];
    
    SpeedTest *t3 = [[SpeedTest alloc] init];
    t3.url = [NSURL URLWithString:@"https://s3.amazonaws.com/certifiednetworkscdn/images/clients/abcmouse/box_learningpath.png"];
    t3.shortDescription = @"CDN AWS cloudfront https   ";
    t3.asyncImage = [[AsyncImage alloc] initWithUrl:[t3.url absoluteString] ];
    t3.asyncImage.Identity = 3;
    t3.asyncImage.shortDescription = @"CDN AWS cloudfront https   ";
    [t3.asyncImage downloadStringWithDelegate:self];
  //  [speedTests addObject:t3];
    
    
    
    SpeedTest *t5 = [[SpeedTest alloc] init];
    t5.url = [NSURL URLWithString:@"http://s3.amazonaws.com/certifiednetworkscdn/images/clients/abcmouse/box_learningpath.png"];
    t5.shortDescription = @"CDN AWS cloudfront http    ";
    t5.asyncImage = [[AsyncImage alloc] initWithUrl:[t5.url absoluteString] ];
    t5.asyncImage.Identity = 5;
    t5.asyncImage.shortDescription = @"CDN AWS cloudfront http    ";
    [t5.asyncImage downloadStringWithDelegate:self];
  //  [speedTests addObject:t5];
    
    
    
    /*
    SpeedTest *t6 = [[SpeedTest alloc] init];
    t6.url = [NSURL URLWithString:@"https://7c4d2e95495f5f00412e-4c4ed84c4c125d6c6d326fcac33451ba.r2.cf1.rackcdn.com/box_learningpath.png"];
    t6.shortDescription = @"CDN rackspace (akamai https)";
    t6.asyncImage = [[AsyncImage alloc] initWithUrl:[t6.url absoluteString] ];
    t6.asyncImage.Identity = 6;
    t6.asyncImage.shortDescription = @"CDN rackspace (akamai https)   ";
    [t6.asyncImage downloadStringWithDelegate:self];
    [speedTests addObject:t6];
    */
    time_t rawtime;
    struct tm * timeinfo;
    
    time ( &rawtime );
    timeinfo = localtime ( &rawtime );
    
    printf("\n /*** box_learningpath.png download - %s", asctime (timeinfo) );
    
   // for (SpeedTest *t in speedTests)
   // {
        //NSLog(@"%@", t.shortDescription);
      //  printf("%d %f \n", t.asyncImage.Identity, t.asyncImage.millisecondsToComplete);
    //}
 
}

- (void)asyncImageReady:(AsyncImage*)asyncImage
{
    NSString *result = [NSString stringWithFormat:@"id:%d %s seconds:%f \n", asyncImage.Identity, [[asyncImage shortDescription] cStringUsingEncoding:NSUTF8StringEncoding],  asyncImage.millisecondsToComplete ];
    
    printf("id:%d %s seconds:%f \n", asyncImage.Identity, [[asyncImage shortDescription] cStringUsingEncoding:NSUTF8StringEncoding],  asyncImage.millisecondsToComplete);
    
    tv.text = [tv.text stringByAppendingString: result];
    NSRange range = NSMakeRange(tv.text.length - 1, 1);
    [tv scrollRangeToVisible:range];
}

@end
