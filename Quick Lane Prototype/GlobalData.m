//
//  GlobalData.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData
@synthesize quickLaneImageView = _quickLaneImageView;
@synthesize selectedVehicle = _selectedVehicle;
@synthesize vehicleNames = _vehicleNames;
@synthesize selectedVehicleLabel = _selectedVehicleLabel;


+(GlobalData*) getInstance {
    static dispatch_once_t onceToken;
    static GlobalData *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[GlobalData alloc] init];
    });
    
    instance.quickLaneImageView = [[UIImageView alloc]
                           initWithImage: [UIImage imageNamed:@"qllogo (1).gif"]];
    [instance.quickLaneImageView setFrame:CGRectMake(30, 70, 250, 40)];
    instance.quickLaneImageView.contentMode = UIViewContentModeCenter;
    instance.quickLaneImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    instance.selectedVehicleLabel = [[UILabel alloc]
                             initWithFrame:CGRectMake(20, 120, 290, 15)];
    [instance.selectedVehicleLabel setContentMode: UIViewContentModeCenter];
    [instance.selectedVehicleLabel setTextAlignment:NSTextAlignmentCenter];
    [instance.selectedVehicleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [instance.selectedVehicleLabel setTextColor:[UIColor colorWithRed:1 green:.6 blue:0 alpha:1]];
    NSString *selectedVehicleLabelText =
    [NSString stringWithFormat:@"%@%@", @"Vehicle: ", instance.selectedVehicle];
    [instance.selectedVehicleLabel setText:selectedVehicleLabelText];

    return instance;
}

-(id) init {
    self = [super init];
    if (self) {
        /*
        _quickLaneImageView = [[UIImageView alloc]
                               initWithImage: [UIImage imageNamed:@"qllogo (1).gif"]];
        [_quickLaneImageView setFrame:CGRectMake(30, 70, 250, 40)];
        _quickLaneImageView.contentMode = UIViewContentModeCenter;
        _quickLaneImageView.contentMode = UIViewContentModeScaleAspectFit;
         */
        _selectedVehicle = @"Vehicle: Not Selected";
        _vehicleNames = [[NSMutableArray alloc] initWithObjects:@"1995 Honda Accord EX",
                                                                @"2001 Ford Escape",
                                                                @"2015 Tesla Model S", nil];
        /*
        _selectedVehicleLabel = [[UILabel alloc]
                                 initWithFrame:CGRectMake(20, 120, 290, 15)];
        [_selectedVehicleLabel setContentMode: UIViewContentModeCenter];
        [_selectedVehicleLabel setTextAlignment:NSTextAlignmentCenter];
        [_selectedVehicleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [_selectedVehicleLabel setTextColor:[UIColor colorWithRed:1 green:.6 blue:0 alpha:1]];
        [_selectedVehicleLabel setText:_selectedVehicle];
         */
    }
    return self;
}

@end
