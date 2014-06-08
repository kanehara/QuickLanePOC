//
//  NewVehicleEntryViewController.m
//  Quick Lane Prototype
//
//  Created by kanehara on 5/30/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "NewVehicleEntryViewController.h"
#import "GlobalData.h"

@interface NewVehicleEntryViewController ()

@end

@implementation NewVehicleEntryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    GlobalData *GD = [GlobalData getInstance];
    [self.view addSubview:GD.quickLaneImageView];
    
    // set picker view options
    modelYears = @[@"2014",
                        @"2013",
                        @"2012",
                        @"2011",
                        @"2010",
                        @"2009",
                        @"2008",
                        @"2007",
                        @"2006",
                        @"2005",
                        @"2004",
                        @"2003",
                        @"2002",
                        @"2001",
                        @"2000",
                        @"1999",
                        @"1998",
                        @"1997",
                        @"1996",
                        @"1995"];
    makes = @[@"Chrysler",
                   @"Chevrolet",
                   @"Ford",
                   @"Honda",
                   @"Jeep",
                   @"Lincoln",
                   @"Mercury",
                   @"Toyota"];
    models = @[@"Explorer", @"Fusion", @"Taurus", @"Flex"];
    submodels = @[@"Sport", @"Convertible"];
    trims = @[@"Base 4WD", @"Base FWD", @"Sport 4WD"];
    conditions = @[@"New", @"Used", @"Worn"];
    
    
    // Set up picker views
    CGRect inputViewFrame = self.modelYearTextField.inputView.frame;
    
    self.modelYearPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    self.modelYearPicker.hidden = YES;
    [self.modelYearPicker setDataSource:self];
    [self.modelYearPicker setDelegate:self];
    
    self.makePicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    self.makePicker.hidden = YES;
    [self.makePicker setDataSource:self];
    [self.makePicker setDelegate:self];
    
    self.modelPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    self.modelPicker.hidden = YES;
    [self.modelPicker setDataSource:self];
    [self.modelPicker setDelegate:self];
    
    self.submodelPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    self.submodelPicker.hidden = YES;
    [self.submodelPicker setDataSource:self];
    [self.submodelPicker setDelegate:self];
    
    self.trimPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    self.trimPicker.hidden = YES;
    [self.trimPicker setDataSource:self];
    [self.trimPicker setDelegate:self];
    
    self.conditionPicker = [[UIPickerView alloc] initWithFrame:inputViewFrame];
    self.conditionPicker.hidden = YES;
    [self.conditionPicker setDataSource:self];
    [self.conditionPicker setDelegate:self];
    
    // Replace keyboard input views
    self.modelYearTextField.inputView = self.modelYearPicker;
    self.modelTextField.inputView = self.modelPicker;
    self.submodelTextField.inputView = self.submodelPicker;
    self.makeTextField.inputView = self.makePicker;
    self.trimTextField.inputView = self.trimPicker;
    self.conditionTextField.inputView = self.conditionPicker;
    
    // Add toolbar with done button
    UIToolbar *myToolbar = [[UIToolbar alloc] initWithFrame:
                            CGRectMake(0, 0, inputViewFrame.size.width, 44)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                              UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                                   UIBarButtonSystemItemDone target:self action:@selector(onDoneButtonPress)];
    [myToolbar setItems:[NSArray arrayWithObjects:space, doneButton, nil] animated:NO];
    
    self.modelYearTextField.inputAccessoryView = myToolbar;
    self.modelTextField.inputAccessoryView = myToolbar;
    self.submodelTextField.inputAccessoryView = myToolbar;
    self.makeTextField.inputAccessoryView = myToolbar;
    self.trimTextField.inputAccessoryView = myToolbar;
    self.conditionTextField.inputAccessoryView = myToolbar;
    
    // Set tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(onDoneButtonPress)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void) onDoneButtonPress {
    
    if ([self.modelYearTextField isFirstResponder]) {
        [self.modelYearTextField resignFirstResponder];
    }
    else if ([self.makeTextField isFirstResponder]) {
        [self.makeTextField resignFirstResponder];
    }
    else if ([self.modelTextField isFirstResponder]) {
        [self.modelTextField resignFirstResponder];
    }
    else if ([self.submodelTextField isFirstResponder]) {
        [self.submodelTextField resignFirstResponder];
    }
    else if ([self.trimTextField isFirstResponder]) {
        [self.trimTextField resignFirstResponder];
    }
    else if ([self.conditionTextField isFirstResponder]) {
        [self.conditionTextField resignFirstResponder];
    }
    else {
        NSLog(@"Error in didSelectRow in NewVehicleEntryViewController.m");
    }
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.modelYearPicker) {
        return [modelYears count];
    }
    else if (pickerView == self.makePicker) {
        return [makes count];
    }
    else if (pickerView == self.modelPicker) {
        return [models count];
    }
    else if (pickerView == self.submodelPicker) {
        return [submodels count];
    }
    else if (pickerView == self.trimPicker) {
        return [trims count];
    }
    else if (pickerView == self.conditionPicker) {
        return [conditions count];
    }
    else {
        NSLog(@"Error in numberOfRowsInComponent in NewVehicleEntryViewController.m");
        return -1;
    }
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = nil;
    if (pickerView == self.modelYearPicker) {
        title = modelYears[row];;
    }
    else if (pickerView == self.makePicker) {
        title = makes[row];
    }
    else if (pickerView == self.modelPicker) {
        title = models[row];
    }
    else if (pickerView == self.submodelPicker) {
        title = submodels[row];
    }
    else if (pickerView == self.trimPicker) {
        title = trims[row];;
    }
    else if (pickerView == self.conditionPicker) {
        title = conditions[row];
    }
    else {
        NSLog(@"Error in numberOfRowsInComponent in NewVehicleEntryViewController.m");
    }
    return title;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([self.modelYearTextField isFirstResponder]) {
        self.modelYearTextField.text = modelYears[row];
    }
    else if ([self.makeTextField isFirstResponder]) {
        self.makeTextField.text = makes[row];
    }
    else if ([self.modelTextField isFirstResponder]) {
        self.modelTextField.text = models[row];
    }
    else if ([self.submodelTextField isFirstResponder]) {
        self.submodelTextField.text = submodels[row];
    }
    else if ([self.trimTextField isFirstResponder]) {
        self.trimTextField.text = trims[row];
    }
    else if ([self.conditionTextField isFirstResponder]) {
        self.conditionTextField.text = conditions[row];
    }
    else {
        NSLog(@"Error in didSelectRow in NewVehicleEntryViewController.m");
    }
}


-(void) textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.modelYearTextField) {
        [self.modelYearPicker setHidden:NO];
    }
    else if (textField == self.makeTextField) {
        [self.makePicker setHidden:NO];
    }
    else if (textField == self.modelTextField) {
        [self.modelPicker setHidden:NO];
    }
    else if (textField == self.submodelTextField) {
        [self.submodelPicker setHidden:NO];
    }
    else if (textField == self.trimTextField) {
        [self.trimPicker setHidden:NO];
    }
    else if (textField == self.conditionTextField) {
        [self.conditionPicker setHidden:NO];
    }
    else {
        NSLog(@"Error in textFieldDidBeginEditing in NewVehicleEntryViewController.m");
    }
}

@end
