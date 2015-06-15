//
//  ListPickerInterfaceController.h
//  CoreDataSample
//
//  Created by Sudarshan Shetty on 6/13/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ListPickerInterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *pickerView;

@end
