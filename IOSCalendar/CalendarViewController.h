//
//  CalendarViewController.h
//  IOSCalendar
//
//  Created by Moran, Jennifer on 11/3/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
// commit to merge

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "AddEventViewController.h"
#import "HomeModel.h"

//@class AddEventViewController;

extern NSArray * parseSpot3;

@interface CalendarViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, EditInfoViewControllerDelegate, HomeModelProtocol,UIGestureRecognizerDelegate>

@property (nonatomic, retain) NSString* userIDSignedIn;

@property (strong, nonatomic) AddEventViewController *addEventViewController;
- (IBAction)nextAct:(id)sender;

- (IBAction)prevAct:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *monthly;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) NSString *currentButtonTitle;
@property (strong, nonatomic) NSDate *defaulComp;

@property (nonatomic, strong) DBManager *dbManager;

@property (weak, nonatomic) UIButton *dayPressed;

-(void)loadData:(id)sender;



- (IBAction)addNewEvent:(id)sender;

@end

