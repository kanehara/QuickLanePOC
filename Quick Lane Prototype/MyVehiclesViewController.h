//
//  WelcomeViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalData.h"

@interface MyVehiclesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) GlobalData *GD;

@property (nonatomic, strong) IBOutlet UIButton *addVehicleEntryButton;
-(IBAction)pressedOnNewVehicleEnryButton:(id)sender;

@end