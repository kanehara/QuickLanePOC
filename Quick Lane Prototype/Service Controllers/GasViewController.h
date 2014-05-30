//
//  GasViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GasViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *myVehiclesButton;
-(IBAction)pressedOnMyVehicles:(id)sender;

@end
