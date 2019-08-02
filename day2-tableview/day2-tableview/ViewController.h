//
//  ViewController.h
//  day2-tableview
//
//  Created by Dave Henson on 7/1/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tableView;
    NSArray *items;
}

@end

