//
//  MyVehicleInfoViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/27/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyVehicleInfoViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIBarButtonItem *sideBarButton;

@property (nonatomic, strong) IBOutlet UILabel *vehicleNameLabel;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *myVehiclesButton;
-(IBAction)pressedOnMyVehicles:(id)sender;

@end
