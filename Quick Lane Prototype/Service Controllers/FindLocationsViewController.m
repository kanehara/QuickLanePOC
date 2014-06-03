//
//  FindLocationsViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/16/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "FindLocationsViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface FindLocationsViewController ()

@end

@implementation FindLocationsViewController

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
    
    // Set vehicles button
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont boldSystemFontOfSize:11], NSFontAttributeName, nil];
    [_myVehiclesButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    // Tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void) dismissKeyboard {
    [self.searchBar resignFirstResponder];
}

-(IBAction)pressedOnMyVehicles:(id)sender {
    [self performSegueWithIdentifier:@"myVehiclesSegue" sender:self];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

@end
