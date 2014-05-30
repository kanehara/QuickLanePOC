//
//  MyMaintenanceViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/28/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "MyMaintenanceViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"
#import "MyMaintenanceChildViewController.h"

@interface MyMaintenanceViewController ()

@end

@implementation MyMaintenanceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    // Set vehicles button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:10], NSFontAttributeName, nil];
    [_myVehiclesButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    // Set selected vehicle label
    _selectedVehicle.text = GD.selectedVehicle;
    
    // Page view controller data config
    self.milestones = @[@"80,000", @"100,000", @"120,000"];
    
    
    NSArray *replaceOptions0 = @[@"Engine Oil",
                                 @"Engine Oil Filter"];
    NSArray *replaceOptions1 = @[@"Coolant",
                                 @"Engine Oil",
                                 @"Engine Oil Filter"];
    NSArray *replaceOptions2 = @[@"Automatic Transaxle Fluid",
                                 @"Manual Transaxle Fluid"];
    self.replaceOptions = @[replaceOptions0, replaceOptions1, replaceOptions2];
    
    NSArray *inspectOptions0 = @[@"Back Brake System",
                                 @"Exhuast System",
                                 @"Fluid & Lubricant Levels",
                                 @"Front Brake System",
                                 @"Parking Brake",
                                 @"Suspension Components"];
    NSArray *inspectOptions1 = @[@"Engine Cooling System Hoses",
                                 @"Fluid & Lubricant Levels",
                                 @"Tie Rod Ends"];
    NSArray *inspectOptions2 = @[@"Driveshaft",
                                 @"Exhaust System",
                                 @"Parking Brake",
                                 @"Suspension Components"];
    self.inspectOptions = @[inspectOptions0, inspectOptions1, inspectOptions2];
    
    NSArray *adjustmentOptions0 = @[@"Rotate Tires"];
    NSArray *adjustmentOptions1 = @[@"Drive Belts"];
    NSArray *adjustmentOptions2 = @[@"Clean Air Cleaner Element"];
    self.adjustmentOptions = @[adjustmentOptions0, adjustmentOptions1, adjustmentOptions2];
    
    
    // Create page controller
    self.pageController = [[UIPageViewController alloc]
                           initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                           navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                           options:nil];
    self.pageController.dataSource = self;
    
    MyMaintenanceChildViewController *firstChildViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[firstChildViewController];
    [self.pageController setViewControllers:viewControllers
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO completion:nil];
    self.pageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    self.containerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageController];
    [self.containerView addSubview:_pageController.view];
    [_pageController didMoveToParentViewController:self];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)pressedOnMyVehicles:(id)sender {
    [self performSegueWithIdentifier:@"myVehiclesSegue" sender:self];
}

// PAGE VIEW CONTROLLER CONFIG
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((MyMaintenanceChildViewController *) viewController).pageIndex;
    
    if (index == 0 || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((MyMaintenanceChildViewController *) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.milestones count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (MyMaintenanceChildViewController *) viewControllerAtIndex:(NSUInteger)index {
    if (([self.milestones count] == 0) || (index >= [self.milestones count])) {
        return nil;
    }
    
    // Create new view controller to pass
    MyMaintenanceChildViewController *myMaintenanceChild = [self.storyboard instantiateViewControllerWithIdentifier:@"myMaintenanceChildView"];
    myMaintenanceChild.milestone = self.milestones[index];
    myMaintenanceChild.header = @"Milestone:";
    myMaintenanceChild.pageIndex = index;
    
    // Set tableView's details
    myMaintenanceChild.inspectArray = self.inspectOptions[index];
    myMaintenanceChild.replaceArray = self.inspectOptions[index];
    myMaintenanceChild.adjustmentArray = self.adjustmentOptions[index];
    
    return myMaintenanceChild;
}

-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

-(NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.milestones count];
}



@end
