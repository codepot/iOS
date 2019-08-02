//
//  ViewController.h
//  day9-instruments-demo
//


#import <UIKit/UIKit.h>


/*!
 @description This is my class documentation
 
 @see apple.com
 @author Dave Henson
 @warning Do not use while drinking!
 @ref http://www.google.com
 
 */
@interface ViewController : UIViewController
{
    UIView *redView;
    NSMutableArray *items;
}

/*!
 @description This is a demonstration method created in class before coffee.
 @param someParam of type NSString that is not used for anything
 @return void
 
 */
-(void)someMethod:(NSString *)someParam;


@end

