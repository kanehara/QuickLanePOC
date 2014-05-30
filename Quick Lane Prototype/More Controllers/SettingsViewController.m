//
//  SettingsViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "GlobalData.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    
    // get rid of extra seperators
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingsCell"];
    
    NSInteger row = indexPath.row;
    
    NSString *cellText = NULL;
    
    switch (row) {
        case 0:
            cellText = @"My Vehicle Information";
            break;
        case 1:
            cellText = @"Push Notification";
            break;
        case 2:
            cellText = @"Language";
            break;
        case 3:
            cellText = @"Permissions";
            break;
        default:
            NSLog(@"Error in cellForRowAtIndexPath in SettingsViewController.m");
            break;
    }
    cell.textLabel.text = cellText;
    
    // The Right Arrow
    UIImageView *rightArrow = [[UIImageView alloc] initWithFrame:
                               CGRectMake(250, cell.frame.size.height/2, 40, 20)];
    rightArrow.image = [UIImage imageNamed:@"RightArrow"];
    rightArrow.contentMode = UIViewContentModeScaleAspectFit;
    
    [cell setAccessoryView:rightArrow];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
