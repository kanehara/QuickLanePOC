//
//  GlobalData.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#ifndef Quick_Lane_Prototype_GlobalData_h
#define Quick_Lane_Prototype_GlobalData_h

@interface GlobalData : NSObject {
    
    UIImageView *_quickLaneImageView;
    
    UILabel *_selectedVehicleLabel;
    
    NSString *_selectedVehicle;
    
    NSMutableArray *_vehicleNames;
}

@property(nonatomic, strong, readwrite) UIImageView *quickLaneImageView;
@property(nonatomic, strong, readwrite) NSString *selectedVehicle;
@property (nonatomic, strong, readwrite) NSMutableArray *vehicleNames;
@property (nonatomic, strong, readwrite) UILabel *selectedVehicleLabel;

+(GlobalData*) getInstance;

@end


#endif
