//
//  AnimationInterfaceController.m
//  CoreDataSample
//
//  Created by Sudarshan Shetty on 6/12/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import "AnimationInterfaceController.h"

@interface AnimationInterfaceController ()

@end

@implementation AnimationInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.theGroupArray=[[NSMutableArray alloc]init];
    

     [self.theGroupArray addObject:self.Group1];
     [self.theGroupArray addObject:self.Group2];
     [self.theGroupArray addObject:self.Group3];
     [self.theGroupArray addObject:self.Group4];
     [self.theGroupArray addObject:self.Group5];
     [self.theGroupArray addObject:self.Group6];
     [self.theGroupArray addObject:self.Group7];
     [self.theGroupArray addObject:self.Group8];
     [self.theGroupArray addObject:self.Group9];
     [self.theGroupArray addObject:self.Group10];
     [self.theGroupArray addObject:self.Group11];
     [self.theGroupArray addObject:self.Group12];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    

    for (NSUInteger i=0; i< self.theGroupArray.count; i++) {
        
        WKInterfaceGroup *thegroup=[self.theGroupArray objectAtIndex:i];
    
        dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, ((i*0.05) *NSEC_PER_SEC));
        dispatch_after(time, dispatch_get_main_queue(), ^{
            [self animateWithDuration:0.04 animations:^{
                
                if (i<5) {
                     [thegroup setAlpha:1];
                }
                else
                {
                     [thegroup setAlpha:0.4];
                }
               
            }];

        });
     
}
}



- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



