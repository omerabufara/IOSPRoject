//
//  AddEditEvintViewController.h
//  IOSCalendar
//
//  Created by Hamzah Arishi on 11/17/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditInfoViewControllerDelegate;

@interface AddEditEvintViewController : UIViewController

@property (nonatomic, strong) id <EditInfoViewControllerDelegate> delegate;

@property (strong, nonatomic) AddEditEvintViewController *detailItem;

@property (nonatomic) int recordIDToEdit;

@property (weak, nonatomic) IBOutlet UITextField *txtEventName;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDate;

@property (weak, nonatomic) IBOutlet UITextField *txtEventTime;

@property (weak, nonatomic) IBOutlet UITextField *txtEventLocation;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDescription;

@property (weak, nonatomic) IBOutlet UITextField *txtEventVisible;

- (IBAction)saveInfo:(id)sender;
@end
