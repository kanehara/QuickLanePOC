//
//  MyMaintenanceViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/28/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMaintenanceViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *sideBarButton;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *myVehiclesButton;

-(IBAction)pressedOnMyVehicles:(id)sender;

@property (nonatomic, weak) IBOutlet UILabel *selectedVehicle;

@property (nonatomic, weak) IBOutlet UIView *containerView;

@property (strong, nonatomic) UIPageViewController *pageController;

@property (strong, nonatomic) NSArray *milestones;

@property (strong, nonatomic) NSArray *replaceOptions;
@property (strong, nonatomic) NSArray *inspectOptions;
@property (strong, nonatomic) NSArray *adjustmentOptions;

@end
