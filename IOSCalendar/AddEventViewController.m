//
//  AddEventViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "AddEventViewController.h"
#import "CalendarViewController.h"
#import "DBManager.h"
#import "HomeModel.h"
#import "Location.h"

@interface AddEventViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@interface AddEventViewController ()
{
    HomeModel *_homeModel;
    NSArray *_feedItems;
}

@end

@implementation AddEventViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    
    self.txtEventName.delegate = self;
    self.txtEventDate.delegate = self;
    self.txtEventTime.delegate = self;
    self.txtEventLocation.delegate = self;
    self.txtEventDescription.delegate = self;
    self.txtEventVisible.delegate = self;
    
    //self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"PSSH.sql"];

//    _feedItems = [[NSArray alloc]init];
//    _homeModel = [[HomeModel alloc]init];
    //HomeModel.delegate = self;
    
   // [_homeModel downloadItems:day monthly:self.monthly.text year:self.year.text];
    
//    // Check if should load specific record for editing.
//    if (self.recordIDToEdit != -1) {
//        // Load the record with the specific ID from the database.
//        [self loadInfoToEdit];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//-(void)loadInfoToEdit{
//    // Create the query.
//    NSString *query = [NSString stringWithFormat:@"select * from eventsTable where ID=%d", self.recordIDToEdit];
//
//    // Load the relevant data.
//    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
//
//    // Set the loaded data to the textfields.
//    self.txtEventName.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"event_name"]];
//
//    self.txtEventDate.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"event_date"]];
//
//    self.txtEventTime.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"event_time"]];
//
//    self.txtEventLocation.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"event_location"]];
//
//    self.txtEventDescription.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"event_description"]];
//
//    self.txtEventVisible.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"event_visible"]];
//}




- (IBAction)saveInfo:(id)sender{
//        NSMutableString *query = [NSMutableString stringWithFormat:@"insert into events values (null ,'%@' , '%@' , '%@' , '%@' , '%@'  )", self.txtEventName.text, self.txtEventDate.text, self.txtEventTime.text, self.txtEventLocation.text, self.txtEventDescription.text];
//    
//    // Execute the query.
//    [self.dbManager executeQuery:query];
    
    HomeModel *add = [[HomeModel alloc]init];
    
    NSString *eventName = self.txtEventName.text;
    
    NSString *eventDate = self.txtEventDate.text;
    
    NSString *eventTime = self.txtEventTime.text;
    
    NSString *eventLocation = self.txtEventLocation.text;
    
    NSString *eventDescription = self.txtEventDescription.text;
    
    [add addItems:eventName date:eventDate time:eventTime location:eventLocation description:eventDescription ];
    
    [self.delegate editingInfoWasFinished];
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    // If the query was successfully executed then pop the view controller.
//    if (self.dbManager.affectedRows != 0) {
//        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
//        
//       
//
//      
//    }
//    else{
//        NSLog(@"Could not execute the query.");
//    }
}

- (void)postEventsDay:(NSString *)date{
    
    HomeModel *add = [[HomeModel alloc]init];
    [add postEventsByDay:date];
}

- (void)postEventsMonth:(NSString *)date{
    NSArray *dateComponentArray = [date componentsSeparatedByString:@"-"];
    NSString *eventMonth = dateComponentArray[0];
    NSString *eventYear = dateComponentArray[2];
    HomeModel *add = [[HomeModel alloc]init];
    [add postEventsByMonth:eventMonth year:eventYear];
}

@end
