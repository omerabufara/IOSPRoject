//
//  EditEventViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@protocol addInfoViewControllerDelegate;
//@protocol EditInfoViewControllerDelegate;
//
@interface EditEventViewController : UIViewController <UITextFieldDelegate>

//@property (nonatomic) int recordIDToEdit;

@property (nonatomic, strong) id <addInfoViewControllerDelegate> delegating;

@property (weak, nonatomic) IBOutlet UITextField *txtEventName;

@property (weak, nonatomic) IBOutlet UITextField *txtEventTime;

@property (weak, nonatomic) IBOutlet UITextField *txtEventLocation;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDescription;

-(void)loadInfoToEdit: (NSInteger*)recordid name: (NSString*)eventName time:(NSString*)eventtime location:(NSString*)eventLoc description:(NSString*)eventDes;

@end


@protocol addInfoViewControllerDelegate

-(void)addingInfoWasFinished;

@end

//
//
//@protocol EditInfoViewControllerDelegate
//
//-(void)editingInfoWasFinished;
//
//@end