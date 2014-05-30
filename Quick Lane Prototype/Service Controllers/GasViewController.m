//
//  GasViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "GasViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface GasViewController ()

@end

@implementation GasViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Button color config
    _sideBarButton.tintColor = [UIColor colorWithWhite:.3 alpha:1];
    
    // Set side bar button action
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    
    [self.navigationItem setLeftBarButtonItem:_sideBarButton];

    // Set gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    NSInteger row = indexPath.row;
    NSString *cellIdentifier = NULL;
    
    switch (row) {
        case 0:
            cellIdentifier = @"costcoCell";
            break;
        case 1:
            cellIdentifier = @"meijerCell";
            break;
        case 2:
            cellIdentifier = @"valeroCell";
            break;
        case 3:
            cellIdentifier = @"bpCell";
            break;
        case 4:
            cellIdentifier = @"suncoCell";
            break;
        case 5:
            cellIdentifier = @"shellCell";
            break;
        default:
            NSLog(@"Error in cellForRowAtIndexPath in GasViewController.m");
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier
                                                            forIndexPath:indexPath];
    
    return cell;
}

-(IBAction)pressedOnMyVehicles:(id)sender {
    [self performSegueWithIdentifier:@"myVehiclesSegue" sender:self];
}

@end
