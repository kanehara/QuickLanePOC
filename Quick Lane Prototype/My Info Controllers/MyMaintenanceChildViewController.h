//
//  MyMaintenanceChildViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/28/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMaintenanceChildViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSUInteger pageIndex;

@property (assign, nonatomic) NSString *milestone;

@property (assign, nonatomic) NSArray *adjustmentArray;
@property (assign, nonatomic) NSArray *inspectArray;
@property (assign, nonatomic) NSArray *replaceArray;

@property (assign, nonatomic) NSString *header;

@property (nonatomic, weak) IBOutlet UILabel *milestoneLabel;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, weak) IBOutlet UILabel *headerLabel;

@end
