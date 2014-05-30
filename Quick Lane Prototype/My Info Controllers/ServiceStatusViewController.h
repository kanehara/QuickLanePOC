//
//  ServiceStatusViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceStatusViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIBarButtonItem *sideBarButton;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *myVehiclesButton;
-(IBAction)pressedOnMyVehicles:(id)sender;

@property (nonatomic, weak) IBOutlet UILabel *selectedVehicle;

@end
