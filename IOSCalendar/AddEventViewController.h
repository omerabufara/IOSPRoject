//
//  AddEventViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddProtocols;

@interface AddEventViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <AddProtocols> delegate;

@property (weak, nonatomic) IBOutlet UITextField *txtEventName;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDate;

@property (weak, nonatomic) IBOutlet UITextField *txtEventTime;

@property (weak, nonatomic) IBOutlet UITextField *txtEventLocation;

@property (weak, nonatomic) IBOutlet UITextField *txtEventDescription;

@property (weak, nonatomic) IBOutlet UITextField *txtEventVisible;

- (IBAction)saveInfo:(id)sender;

@end

@protocol AddProtocols <NSObject>

- (void)loadData;

@end
