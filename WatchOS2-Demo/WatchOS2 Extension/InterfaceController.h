//
//  InterfaceController.h
//  WatchOS2 Extension
//
//  Created by Sudarshan Shetty on 6/12/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
@import WatchConnectivity;

@interface InterfaceController : WKInterfaceController<WCSessionDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *listtable;
@property (nonatomic,retain) NSMutableArray *mTheListArray;
@end
