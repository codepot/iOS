//
//  ViewController.h
//  day3-connection-delegate
//
//  Created by Dave Henson on 7/8/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate>
{
    UITextView *textView;
    
    NSURLConnection *connection;
    
    NSMutableData *myData;
}

@end

