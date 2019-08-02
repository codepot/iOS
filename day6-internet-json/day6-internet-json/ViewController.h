//
//  ViewController.h
//  day6-internet-json
//
//  Created by Dave Henson on 7/29/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *tableview;
    NSMutableArray *students;
}

@end

