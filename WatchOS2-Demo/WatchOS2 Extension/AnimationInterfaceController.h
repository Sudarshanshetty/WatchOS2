//
//  AnimationInterfaceController.h
//  CoreDataSample
//
//  Created by Sudarshan Shetty on 6/12/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface AnimationInterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *theGroup;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group3;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group4;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group5;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group6;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group7;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group8;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group9;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group10;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group11;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *Group12;

@property (retain, nonatomic) IBOutlet NSMutableArray *theGroupArray;


@end
