//
//  NewVehicleEntryViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 5/30/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewVehicleEntryViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray *modelYears;
    NSArray *models;
    NSArray *makes;
    NSArray *submodels;
    NSArray *trims;
    NSArray *conditions;
}

@property (nonatomic, weak) IBOutlet UITextField *modelYearTextField;
@property (nonatomic, weak) IBOutlet UITextField *modelTextField;
@property (nonatomic, weak) IBOutlet UITextField *makeTextField;
@property (nonatomic, weak) IBOutlet UITextField *submodelTextField;
@property (nonatomic, weak) IBOutlet UITextField *trimTextField;
@property (nonatomic, weak) IBOutlet UITextField *conditionTextField;

@property (nonatomic, strong) UIPickerView *modelYearPicker;
@property (nonatomic, strong) UIPickerView *modelPicker;
@property (nonatomic, strong) UIPickerView *makePicker;
@property (nonatomic, strong) UIPickerView *submodelPicker;
@property (nonatomic, strong) UIPickerView *trimPicker;
@property (nonatomic, strong) UIPickerView *conditionPicker;


@end
