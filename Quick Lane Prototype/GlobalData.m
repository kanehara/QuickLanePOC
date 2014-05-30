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


+(GlobalData*) getInstance {
    static dispatch_once_t onceToken;
    static GlobalData *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[GlobalData alloc] init];
    });
    return instance;
}

-(id) init {
    self = [super init];
    if (self) {
        _quickLaneImageView = [[UIImageView alloc]
                               initWithImage: [UIImage imageNamed:@"qllogo (1).gif"]];
        [_quickLaneImageView setFrame:CGRectMake(30, 80, 250, 40)];
        _quickLaneImageView.contentMode = UIViewContentModeCenter;
        _quickLaneImageView.contentMode = UIViewContentModeScaleAspectFit;
        _selectedVehicle = nil;
        _vehicleNames = [[NSMutableArray alloc] initWithObjects:@"1995 Honda Accord EX",
                                                                @"2001 Ford Escape",
                                                                @"2015 Tesla Model S", nil];
    }
    return self;
}

@end
