//
//  MyFavoriteLocationDetailViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "MyFavoriteLocationDetailViewController.h"
#import "GlobalData.h"

@interface MyFavoriteLocationDetailViewController ()

@end

@implementation MyFavoriteLocationDetailViewController

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
    // Set header Quick Lane image
    GlobalData *GD = [GlobalData getInstance];
    [self.view addSubview:GD.quickLaneImageView];
    
    // Set selected vehicle label
    _selectedVehicle.text = GD.selectedVehicle;

}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSString *cellIdentifier = nil;
    
    switch (row) {
        case 0:
            cellIdentifier = @"myFavLocationSH0";
            break;
        case 1:
            cellIdentifier = @"myFavLocationSH1";
            break;
        case 2:
            cellIdentifier = @"myFavLocationSH2";
            break;
        case 3:
            cellIdentifier = @"myFavLocationSH3";
            break;
        default:
            NSLog(@"Error in cellForRowAtIndexPath in MaintenanceRecommendationVC");
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}


@end
