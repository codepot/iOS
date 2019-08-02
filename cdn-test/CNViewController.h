//
//  CNViewController.h
//  cdn-test
//
//  Created by Dave Henson on 5/19/14.

#import <UIKit/UIKit.h>
#import "AsyncImage.h"

#import "SpeedTest.h"

@interface CNViewController : UIViewController
{
    NSMutableArray *speedTests;
    
    UITextView *tv;
    
    UILabel *instructions;
}
@end
