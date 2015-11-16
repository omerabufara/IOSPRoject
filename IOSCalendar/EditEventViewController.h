//
//  EditEventViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


@protocol EditInfoViewControllerDelegate;

@interface EditEventViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) int recordIDToEdit;

@property (nonatomic, strong) id <EditInfoViewControllerDelegate> delegate;


@property (weak, nonatomic) IBOutlet UITextField *txtEventName;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDate;

@property (weak, nonatomic) IBOutlet UITextField *txtEventTime;

@property (weak, nonatomic) IBOutlet UITextField *txtEventLocation;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDescription;

@property (weak, nonatomic) IBOutlet UITextField *txtEventVisible;

-(void)loadInfoToEdit;


@end


@protocol EditInfoViewControllerDelegate

-(void)editingInfoWasFinished;

@end