//
//  pickerTypeController.m
//  CoreDataSample
//
//  Created by Sudarshan Shetty on 6/12/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import "pickerTypeController.h"

@interface pickerTypeController ()

@end

@implementation pickerTypeController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}
- (IBAction)onList {
    [self presentControllerWithName:@"ListPicker" context:@"1"];
}
- (IBAction)onStack {
    [self presentControllerWithName:@"Crown" context:@"2"];

}
- (IBAction)onImageSequence {
    [self presentControllerWithName:@"ImageSequence" context:@"3"];

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



