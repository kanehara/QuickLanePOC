//
//  SearchByTireSpecsViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 6/3/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "SearchByTireSpecsViewController.h"
#import "GlobalData.h"

@interface SearchByTireSpecsViewController ()

@end

@implementation SearchByTireSpecsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    GlobalData *GD = [GlobalData getInstance];
    [self.view addSubview:GD.quickLaneImageView];
    
    // Set array of options
    widths = @[@"7.00", @"7.50", @"8.00", @"8.75", @"9.00", @"9.50", @"10.00", @"11.00",
                    @"12.00", @"27.00", @"30.00", @"31.00", @"32.00"];
    aspectRatios = @[@"25", @"30", @"35", @"40"];
    rimSizes = @[@"18", @"20", @"30"];
    
    // Set pickers
    CGRect inputViewFrame = self.widthPicker.inputView.frame;
    
    self.widthPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    [self.widthPicker setHidden:YES];
    [self.widthPicker setDataSource:self];
    [self.widthPicker setDelegate:self];
    self.widthField.inputView = self.widthPicker;
    
    self.aspectRatioPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    [self.aspectRatioPicker setHidden:YES];
    [self.aspectRatioPicker setDataSource:self];
    [self.aspectRatioPicker setDelegate:self];
    self.aspectRatioField.inputView = self.aspectRatioPicker;
    
    self.rimSizePicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    [self.rimSizePicker setHidden:YES];
    [self.rimSizePicker setDataSource:self];
    [self.rimSizePicker setDelegate:self];
    self.rimSizeField.inputView = self.rimSizePicker;
    
    // Set toolbar
    UIToolbar *pickerToolBar = [[UIToolbar alloc]
                                initWithFrame:
                                CGRectMake(0, 0, inputViewFrame.size.width, 44)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                              target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                   target:self action:@selector(onDoneButtonPress)];
    [pickerToolBar setItems:[NSArray arrayWithObjects:space, doneButton, nil] animated:NO];
    
    self.widthField.inputAccessoryView = pickerToolBar;
    self.aspectRatioField.inputAccessoryView = pickerToolBar;
    self.rimSizeField.inputAccessoryView = pickerToolBar;
    
    // Set tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(onDoneButtonPress)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)onDoneButtonPress {
    if ([self.widthField isFirstResponder]) {
        [self.widthField resignFirstResponder];
    }
    else if ([self.aspectRatioField isFirstResponder]) {
        [self.aspectRatioField resignFirstResponder];
    }
    else if ([self.rimSizeField isFirstResponder]) {
        [self.rimSizeField resignFirstResponder];
    }
    else {
        NSLog(@"Error in onDoneButtonPress in SearchByTireSpecsViewController.m");
    }
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.widthField) {
        [self.widthPicker setHidden:NO];
    }
    else if (textField == self.aspectRatioField) {
        [self.aspectRatioPicker setHidden:NO];
    }
    else if (textField == self.rimSizeField) {
        [self.rimSizePicker setHidden:NO];
    }
    else {
        NSLog(@"Error in textFieldDidBeginEditing in SearchByTireSpecsViewController.m");
    }
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.widthPicker) {
        self.widthField.text = widths[row];
    }
    else if (pickerView == self.aspectRatioPicker) {
        self.aspectRatioField.text = aspectRatios[row];
    }
    else if (pickerView == self.rimSizePicker) {
        self.rimSizeField.text = rimSizes[row];
    }
    else {
        NSLog(@"Error in didSelectRow in SearchByTireSpecsViewController.m");
    }
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.widthPicker) {
        return [widths count];
    }
    else if (pickerView == self.aspectRatioPicker) {
        return [aspectRatios count];
    }
    else if (pickerView == self.rimSizePicker) {
        return [rimSizes count];
    }
    else {
        NSLog(@"Error in nubmerOfRowsInComponent in SearchByTireSpecsViewController.m");
        return -1;
    }
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.widthPicker) {
        return widths[row];
    }
    else if (pickerView == self.aspectRatioPicker) {
        return aspectRatios[row];
    }
    else if (pickerView == self.rimSizePicker) {
        return rimSizes[row];
    }
    else {
        NSLog(@"Error in titleForRow in SearchByTireSpecsViewController.m");
        return nil;
    }
}

@end
