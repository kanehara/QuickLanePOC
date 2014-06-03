//
//  SearchTiresViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/16/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "SearchTiresViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"
#import "TireTableViewCell.h"

@interface SearchTiresViewController ()

@end

@implementation SearchTiresViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    [self.view addSubview:GD.selectedVehicleLabel];
    
    // Set vehicles button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:10], NSFontAttributeName, nil];
    [_myVehiclesButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TireTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tireCell"];
    NSString *imageName = nil;
    
    NSInteger section = indexPath.section;
    if (section == 0) {
        imageName = @"recommendedTire.png";
    }
    else {
        switch (indexPath.row) {
            case 0:
                imageName = @"otherTire0.png";
                break;
            case 1:
                imageName = @"otherTire1.png";
                break;
            case 2:
                imageName = @"otherTire2.png";
                break;
            case 3:
                imageName = @"otherTire3.png";
                break;
            case 4:
                imageName = @"otherTire4.png";
                break;
            default:
                NSLog(@"Reached default in cellForRowAtIndexPath in SearchTiresViewController.m");
                break;
        }
    }
    
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = nil;
    switch (section) {
        case 0:
            title = @"Recommended Tires";
            break;
        case 1:
            title = @"Other Tires";
            break;
        default:
            NSLog(@"Reached default case in titleForHeaderInSection in SearchTiresViewController.m");
            break;
    }
    
    return title;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numRows = -1;
    switch (section) {
        case 0:
            numRows = 1;
            break;
        case 1:
            numRows = 5;
            break;
        default:
            NSLog(@"Reached default case in numberOfRowsInSection in SearchTiresViewController.m");
            break;
    }
    return numRows;
}

-(IBAction)pressedOnMyVehicles:(id)sender {
    [self performSegueWithIdentifier:@"myVehiclesSegue" sender:self];
}

-(IBAction)pressedOnSearchBySpecsButton:(id)sender {
    [self performSegueWithIdentifier:@"searchBySpecsSegue" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"searchBySpecsSegue"]) {
        [[segue destinationViewController] setTitle: self.searchBySpecsButton.titleLabel.text];
    }
}

@end