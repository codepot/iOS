//
//  ViewController.m
//  day2-tableview
//
//  Created by Dave Henson on 7/1/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    items = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
    
    self.view.backgroundColor = [UIColor darkGrayColor];

    tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.frame = CGRectMake(100.0, 100.0, 300.0, 500.0);
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    NSString *item = [items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item;
    
    return cell;

}


@end
