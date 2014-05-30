//
//  WelcomeViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "MyVehiclesViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"
#import "MyVehicleInfoViewController.h"

@interface MyVehiclesViewController ()

@end

@implementation MyVehiclesViewController

@synthesize GD;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // get rid of extra seperators
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Set header Quick Lane image
    GD = [GlobalData getInstance];
    [self.view addSubview:GD.quickLaneImageView];
    
    // Get rid of extra header space
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (GD.selectedVehicle == nil) {
        _selectedVehicleLabel.text = @"Not Selected";
    }
    else {
        _selectedVehicleLabel.text = GD.selectedVehicle;
    }
    
    [_selectedVehicleLabel setCenter:self.view.center];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSString *cellIdentifier = nil;
    
    
    switch (row) {
        case 0:
            cellIdentifier = @"hondaCell";
            break;
        case 1:
            cellIdentifier = @"fordCell";
            break;
        case 2:
            cellIdentifier = @"teslaCell";
            break;
        default:
            NSLog(@"Error in cellForRowAtIndexPath in WelcomeViewController.m");
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}
/*
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MyVehicleInfoViewController *destinationViewController = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSInteger row = indexPath.row;
    
    NSString *vehicleName = GD.vehicleNames[row];
    
    destinationViewController.vehicleNameText = vehicleName;
}*/

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedVehicleLabel.text = GD.selectedVehicle;
    
    NSInteger row = indexPath.row;
    NSString *selectedVehicleString = GD.vehicleNames[row];
    [GD setSelectedVehicle:selectedVehicleString];
}

@end
