//
//  InterfaceController.m
//  WatchOS2 Extension
//
//  Created by Sudarshan Shetty on 6/12/15.
//  Copyright © 2015 Sudarshan Shetty. All rights reserved.
//

#import "InterfaceController.h"
#import "controllerRow.h"
#import "PickerInterfaceController.h"




@interface InterfaceController()

@end


@implementation InterfaceController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [WCSession defaultSession].delegate = self;
        [[WCSession defaultSession] activateSession];
        
    }
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Activate the session on both sides to enable communication.
 
    self.mTheListArray=[[NSMutableArray alloc]init];
    [self.mTheListArray addObject:@"Alert"];
    [self.mTheListArray addObject:@"Crown"];
    [self.mTheListArray addObject:@"Video"];
    [self.mTheListArray addObject:@"Audio"];
     [self.mTheListArray addObject:@"Action-View"];
    [self.mTheListArray addObject:@"Animation"];
    [self.mTheListArray addObject:@"phone"];
    [self.mTheListArray addObject:@"SMS"];
    [self loadthetableview];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

-(void)loadthetableview
{
    [self.listtable setNumberOfRows:self.mTheListArray.count withRowType:@"theRow"];
    
    for (int i=0; i<self.mTheListArray.count; i++) {
        controllerRow* theRow = [self.listtable rowControllerAtIndex:i];
     
        [theRow.rowcell setText:[self.mTheListArray objectAtIndex:i]];
        
    }
    
}


-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
   
    switch (rowIndex) {
        case 0:
            [self WatchAlertDsiplay];
            break;
        case 1:
            [self crownusage];
            break;
        case 2:
            [self playVideo];
            break;
        case 3:
            [self recordAudio];
            break;
        case 4:
              [self WatchActionDsiplay];
            break;
        case 5:
             [self displayAnimationController];
            break;
         case 6:
            [self doPhone];
            break;
        case 7:
           [self doSMS];
            break;
            
        default:
            break;
    }


}

-(void)WatchActionDsiplay
{
    WKAlertAction *theAction=  [WKAlertAction actionWithTitle:@"Delete" style:WKAlertActionStyleDefault handler:^{
        
    }];
    
    WKAlertAction *theAction1=  [WKAlertAction actionWithTitle:@"Edit" style:WKAlertActionStyleDefault handler:^{
        
    }];
    
    
    
    NSArray *theArray=[NSArray arrayWithObjects:theAction,theAction1, nil];
    [self presentAlertControllerWithTitle:@"test" message:@"Actions" preferredStyle:WKAlertControllerStyleActionSheet actions:theArray
     ];
    

    
    
}


-(void)WatchAlertDsiplay
{
    WKAlertAction *theAction=  [WKAlertAction actionWithTitle:@"Cancel" style:WKAlertActionStyleDefault handler:^{
        
    }];
    
    WKAlertAction *theAction1=  [WKAlertAction actionWithTitle:@"Save" style:WKAlertActionStyleDefault handler:^{
        
    }];
    
    
    NSArray *theArray=[NSArray arrayWithObjects:theAction, theAction1,nil];
    [self presentAlertControllerWithTitle:@"test" message:@"Alert here" preferredStyle:WKAlertControllerStyleSideBySideButtonsAlert actions:theArray
     ];
    

}

-(void)crownusage
{
    [self
     presentControllerWithName:@"pickerType" context:nil];
}

-(void)recordAudio
{
    NSUInteger timeAtRecording = (NSUInteger)[NSDate timeIntervalSinceReferenceDate];
    __block NSString *recordingName = [NSString stringWithFormat:@"AudioRecording-%d.mp4", timeAtRecording];
    __block NSURL * outputURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"test.mp4"];
        [self presentAudioRecordingControllerWithOutputURL:outputURL preset:WKAudioRecordingPresetNarrowBandSpeech maximumDuration:30 actionTitle:nil completion:^(BOOL didSave, NSError * __nullable error) {
       
        
        if (didSave) {
           
            NSURL *extensionDirectory = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
            
            NSURL *outputExtensionURL = [extensionDirectory URLByAppendingPathComponent:recordingName];
            
            NSError *moveError;
            
            NSLog(@"outputURL: %@", outputURL);
            NSLog(@"outputExtensionURL: %@", outputExtensionURL);
            
            // Move the file.
            BOOL success = [[NSFileManager defaultManager] moveItemAtURL:outputURL toURL:outputExtensionURL error:&moveError];
            
            if (!success) {
                NSLog(@"Failed to move the outputURL to the extension's documents direcotry: %@", error);
            }
            else {

                // Activate the session before transferring the file.
                [[WCSession defaultSession] transferFile:outputExtensionURL metadata:nil];
            }
        
        }
        
        if (error) {
            NSLog(@"There was an error with the audio recording: %@.", error);
        }
    }];
}

-(void)playVideo
{
     NSURL *movieTwo = [[NSBundle mainBundle] URLForResource:@"sample_clip2" withExtension:@"mov"];
    
    [self presentMediaPlayerControllerWithURL:movieTwo options:nil completion:
     ^(BOOL didPlayToEnd, NSTimeInterval endTime, NSError * __nullable error) {
         
     }];
}
-(void)doPhone
{
    
    [[WKExtension sharedExtension] openSystemURL:[NSURL URLWithString:@"tel:3035551212"]];
}

-(void)doSMS
{
    [[WKExtension sharedExtension] openSystemURL:[NSURL URLWithString:@"sms://9016098909891"]];
    
}

- (NSURL *)applicationDocumentsDirectory
{

    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


-(void)displayAnimationController
{
      [self pushControllerWithName:@"Animation" context:nil];
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}




#pragma mark - WCSessionDelegate

- (void)session:(nonnull WCSession *)session didFinishFileTransfer:(nonnull WCSessionFileTransfer *)fileTransfer error:(nullable NSError *)error {
    // This method is called on the sending side when the file has successfully transfered.
    if (error) {
        NSLog(@"There was an error transferring the file: %@", error);
    }
    else {
        NSLog(@"The file was transfered succesfully!");
    }
}


@end



