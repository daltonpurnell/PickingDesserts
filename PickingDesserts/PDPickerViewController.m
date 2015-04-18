//
//  PDPickerViewController.m
//  PickingDesserts
//
//  Created by Dalton on 4/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PDPickerViewController.h"

@interface PDPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UILabel *picked;


@end

@implementation PDPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *picked = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 30)];
    
    picked.textAlignment = NSTextAlignmentCenter;
    
    picked.font = [UIFont boldSystemFontOfSize:20];
    
    [self.view addSubview:picked];
    
    self.picked = picked;
    
    UIPickerView *picker = [UIPickerView new];
    
    picker.frame = CGRectMake(0, (self.view.frame.size.height - picker.frame.size.height) / 2, picker.frame.size.width, picker.frame.size.height);
    
    picker.delegate = self;
    picker.dataSource = self;
    
    [self.view addSubview:picker];
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSInteger selectedRowIncomponentZero = [pickerView selectedRowInComponent:0];
    NSString *fruit = self.data[0][selectedRowIncomponentZero];
    
    NSString *liquid = self.data[1][[pickerView selectedRowInComponent:1]];
    
    NSString *dessert = self.data[2][[pickerView selectedRowInComponent:2]];
    
    NSString *completeDessert = [NSString stringWithFormat:@"%@ %@ %@", fruit, liquid, dessert];
    
    
    // set picked label to completeDessert
    self.picked.text = completeDessert;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.data[component][row];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return [self.data count];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.data[component] count];
}


-(NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

-(NSArray *)fruits {
    
    return @[@"banana",
             @"apple",
             @"orange"];
}

-(NSArray *)liquids {
    
    return @[@"milk",
             @"soda",
             @"juice"];
}

-(NSArray *)desserts {
    
    return @[@"cake",
             @"pie",
             @"cookies"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
