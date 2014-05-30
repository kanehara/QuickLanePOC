//
//  MyMaintenanceChildViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/28/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "MyMaintenanceChildViewController.h"

@interface MyMaintenanceChildViewController ()

@end

@implementation MyMaintenanceChildViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.milestoneLabel.text = self.milestone;
    self.headerLabel.text = self.header;
    
    // get rid of extra seperators
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maintenanceCell"];
    
    NSString *cellText = nil;
    
    switch (section) {
        case 0:
            cellText = self.adjustmentArray[row];
            break;
        case 1:
            cellText = self.inspectArray[row];
            break;
        case 2:
            cellText = self.replaceArray[row];
            break;
        default:
            NSLog(@"Reached default in cellForRowATIndexPath in MyMaintenanceChildViewController.m");
            break;
    }
    
    cell.textLabel.text = cellText;
    [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numRows = -1;
    
    switch (section) {
        case 0:
            numRows = [self.adjustmentArray count];
            break;
        case 1:
            numRows = [self.inspectArray count];
            break;
        case 2:
            numRows = [self.replaceArray count];
            break;
        default:
            NSLog(@"Reached default in numberOfRowsInSection in MyMaintenanceChildViewController.m");
            break;
    }
    return numRows;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = nil;
    
    switch (section) {
        case 0:
            title = @"Adjust";
            break;
        case 1:
            title = @"Inspect";
            break;
        case 2:
            title = @"Replace";
            break;
        default:
            NSLog(@"Reached default in titleForHeaderInSection in MyMaintenanceChildViewController.m");
            break;
    }
    
    return title;
}

@end
