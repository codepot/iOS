//
//  ViewController.h
//  day5-review-outlets
//
//  Created by Dave Henson on 7/22/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel *myLabel;
@property(nonatomic, weak) IBOutlet UIButton *myButton;

-(IBAction)myButtonClick;

@end

