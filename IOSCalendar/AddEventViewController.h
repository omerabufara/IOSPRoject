//
//  AddEventViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditInfoViewControllerDelegate;

@interface AddEventViewController : UIViewController <UITextFieldDelegate>

//@property (nonatomic) int recordIDToEdit;

@property (nonatomic, strong) id <EditInfoViewControllerDelegate> delegate;

@property (strong, nonatomic) AddEventViewController *detailItem;

@property (weak, nonatomic) IBOutlet UITextField *txtEventName;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDate;

@property (weak, nonatomic) IBOutlet UITextField *txtEventTime;

@property (weak, nonatomic) IBOutlet UITextField *txtEventLocation;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDescription;

@property (weak, nonatomic) IBOutlet UITextField *txtEventVisible;

- (IBAction)saveInfo:(id)sender;

//-(void)loadInfoToEdit;

@end

@protocol EditInfoViewControllerDelegate

-(void)editingInfoWasFinished;

@end
