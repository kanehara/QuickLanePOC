//
//  AppointViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "AppointViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface AppointViewController ()

@end

@implementation AppointViewController

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
    
    // FavoriteLocationsButton config
    _favoriteLocationsButton.tintColor = [UIColor colorWithRed:0 green:(CGFloat)(140/255) blue:(CGFloat)(190/255) alpha:1];
    
    // Set header Quick Lane image
    GlobalData *GD = [GlobalData getInstance];
    
    [self.view addSubview:GD.quickLaneImageView];
}


@end
