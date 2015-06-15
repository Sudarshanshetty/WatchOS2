//
//  ListPickerInterfaceController.m
//  CoreDataSample
//
//  Created by Sudarshan Shetty on 6/13/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import "ListPickerInterfaceController.h"

@interface ListPickerInterfaceController ()

@end

@implementation ListPickerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self ListPicker];
}


-(void)ListPicker
{
    WKPickerItem *narrowBand = [[WKPickerItem alloc] init];
    narrowBand.title = @"Narrow Band";
    
    WKPickerItem *wideBand = [[WKPickerItem alloc] init];
    wideBand.title = @"Wide Band";
    
    WKPickerItem *highQuality = [[WKPickerItem alloc] init];
    highQuality.title = @"High Quality";
    
    NSMutableArray *theArray =[[NSMutableArray alloc]init];
    
    [theArray addObject:narrowBand];
    [theArray addObject:wideBand];
    [theArray addObject:highQuality];
    
    
    // Set the picker items on the picker.
    [self.pickerView setItems:theArray];
    
    [self.pickerView focusForCrownInput];
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



