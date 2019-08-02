//
//  ViewController.m
//  day6-internet-json
//
//  Created by Dave Henson on 7/29/15.

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    students = [[NSMutableArray alloc] init];
    
    tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableview.frame = CGRectMake(10, 40, 300, 500);
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [self.view addSubview:tableview];
    
    [self downloadJsonData];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [students count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Student *s = [students objectAtIndex:indexPath.row];
    
    cell.textLabel.text = s.StudentEmail;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"StudentID:%ldl",(long)[s.StudentID integerValue]];
    
    return cell;
}

-(NSData *)downloadInternetData:(NSString *) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *myData = [NSData dataWithContentsOfURL:url];
    
    return myData;
}

-(void)downloadJsonData
{
    NSData *jsonData = [self downloadInternetData:@"http://ucla201507.certifiednetworks.com/jsonfeed.php"];
    
    NSArray *jsonItems = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *studentDict in jsonItems) {
        Student *s = [[Student alloc] init];
        s.StudentID = [studentDict objectForKey:@"StudentID"];
        s.StudentEmail = [studentDict objectForKey:@"StudentEmail"];
        
        [students addObject:s];
    }
    
    [tableview reloadData];
    
    
}

@end
