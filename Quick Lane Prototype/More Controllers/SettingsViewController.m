//
//  SettingsViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // get rid of extra seperators
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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
                                [UIFont boldSystemFontOfSize:11], NSFontAttributeName, nil];
    [_myVehiclesButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingsCell"];
    
    NSInteger row = indexPath.row;
    
    NSString *cellText = NULL;
    
    switch (row) {
        case 0:
            cellText = @"My Vehicle Information";
            break;
        case 1:
            cellText = @"Push Notification";
            break;
        case 2:
            cellText = @"Language";
            break;
        case 3:
            cellText = @"Permissions";
            break;
        default:
            NSLog(@"Error in cellForRowAtIndexPath in SettingsViewController.m");
            break;
    }
    cell.textLabel.text = cellText;
    
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
