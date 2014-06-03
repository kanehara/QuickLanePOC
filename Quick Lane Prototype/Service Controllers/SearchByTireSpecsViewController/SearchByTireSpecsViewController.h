//
//  SearchByTireSpecsViewController.h
//  Quick Lane Prototype
//
//  Created by kanehara on 6/3/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchByTireSpecsViewController : UIViewController
<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray *widths;
    NSArray *aspectRatios;
    NSArray *rimSizes;
}

@property (nonatomic, weak) IBOutlet UITextField *widthField;
@property (nonatomic, weak) IBOutlet UITextField *aspectRatioField;
@property (nonatomic, weak) IBOutlet UITextField *rimSizeField;

@property (nonatomic, strong) UIPickerView *widthPicker;
@property (nonatomic, strong) UIPickerView *aspectRatioPicker;
@property (nonatomic, strong) UIPickerView *rimSizePicker;

@end
