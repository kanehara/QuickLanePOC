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
    [self.view addSubview:GD.selectedVehicleLabel];
    
    // Get rid of extra header space
    self.automaticallyAdjustsScrollViewInsets = NO;
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


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSString *selectedVehicleString = GD.vehicleNames[row];
    [GD setSelectedVehicle:selectedVehicleString];
}

-(IBAction)pressedOnNewVehicleEnryButton:(id)sender {
    [self performSegueWithIdentifier:@"newVehicleEntrySegue" sender:self];
}

@end
