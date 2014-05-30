//
//  ServiceHistoryTableViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "ServiceHistoryViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface ServiceHistoryViewController ()

@end

@implementation ServiceHistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // get rid of extra seperators
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Get rid of extra header space
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Button color config
    _sideBarButton.tintColor = [UIColor colorWithWhite:.3 alpha:1];
    
    // Set side bar button action
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    
    // Set gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Set header Quick Lane image
    GlobalData *GD = [GlobalData getInstance];
    [self.view addSubview:GD.quickLaneImageView];
    
    // Set vehicles button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:10], NSFontAttributeName, nil];
    [_myVehiclesButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    // Set selected vehicle label
    _selectedVehicle.text = GD.selectedVehicle;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
            cellIdentifier = @"aprCell";
            break;
        case 1:
            cellIdentifier = @"decCell";
            break;
        case 2:
            cellIdentifier = @"mayCell";
            break;
        case 3:
            cellIdentifier = @"janCell";
        default:
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // The Right Arrow
    
    UIImageView *rightArrow = [[UIImageView alloc] initWithFrame:
                               CGRectMake(250, cell.frame.size.height/2, 40, 20)];
    rightArrow.image = [UIImage imageNamed:@"RightArrow"];
    rightArrow.contentMode = UIViewContentModeScaleAspectFit;
    
    [cell setAccessoryView:rightArrow];
    
    return cell;
}

-(IBAction)pressedOnMyVehicles:(id)sender {
    [self performSegueWithIdentifier:@"myVehiclesSegue" sender:self];
}


@end
