//
//  MyFavoriteLocationViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "MyFavoriteLocationViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface MyFavoriteLocationViewController ()

@end

@implementation MyFavoriteLocationViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    [self.view addSubview:GD.selectedVehicleLabel];
    
    // Set vehicles button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont boldSystemFontOfSize:11], NSFontAttributeName, nil];
    [_myVehiclesButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier;
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
            cellIdentifier = @"favLocation0";
            break;
        case 1:
            cellIdentifier = @"favLocation1";
            break;
        case 2:
            cellIdentifier = @"favLocation2";
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

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    NSInteger row = indexPath.row;
    NSString *title = nil;
    switch (row) {
        case 0:
            title = @"Village Ford";
            break;
        case 1:
            title = @"Jack Black Ford";
            break;
        case 2:
            title = @"Lincoln Ann Arbor";
            break;
        default:
            break;
    }
    UIViewController *destinatinonViewController = [segue destinationViewController];
    destinatinonViewController.title = title;
}


@end
