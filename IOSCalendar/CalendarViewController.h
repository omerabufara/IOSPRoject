//
//  CalendarViewController.h
//  IOSCalendar
//
//  Created by Moran, Jennifer on 11/3/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "AddEventViewController.h"
#import "EditEventViewController.h"

//@class AddEventViewController;

@interface CalendarViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, EditInfoViewControllerDelegate>



@property (strong, nonatomic) AddEventViewController *addEventViewController;
@property (strong, nonatomic) EditEventViewController *editEventViewController;

- (IBAction)nextAct:(id)sender;

- (IBAction)prevAct:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *monthly;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) NSDate *defaulComp;

@property (nonatomic, strong) DBManager *dbManager;




- (IBAction)addNewEvent:(id)sender;

@end

