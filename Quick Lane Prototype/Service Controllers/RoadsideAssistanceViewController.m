//
//  RoadsideAssistanceViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "RoadsideAssistanceViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface RoadsideAssistanceViewController ()

@end

@implementation RoadsideAssistanceViewController

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

}

@end
