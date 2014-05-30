//
//  MyFavoriteLocationDetailViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFavoriteLocationDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
