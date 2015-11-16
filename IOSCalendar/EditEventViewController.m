//
//  EditEventViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "EditEventViewController.h"
#import "CalendarViewController.h"
#import "AddEventViewController.h"
#import "DBManager.h"



//@interface EditEventViewController ()
//
////@property (nonatomic, strong) DBManager *dbManager;
//
//@end
//
//@implementation EditEventViewController

//
//- (void)viewDidLoad
//{
//   
//    [super viewDidLoad];
//    
//    // Do any additional setup after loading the view.
//    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
//    
//    self.txtEventName.delegate = self;
//    self.txtEventDate.delegate = self;
//    self.txtEventTime.delegate = self;
//    self.txtEventLocation.delegate = self;
//    self.txtEventDescription.delegate = self;
//    self.txtEventVisible.delegate = self;
////    
////    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"PSSH.sql"];
//}
//
//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
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
//
//- (IBAction)saveInfo:(id)sender{
//    // Prepare the query string.
//    
//    NSMutableString *query;
//    if (self.recordIDToEdit == -1) {
//        query = [NSMutableString stringWithFormat:@"insert into eventsTable values (null ,'%@' , '%@' , '%@' , '%@' , '%@' , '%@' )", self.txtEventName.text, self.txtEventDate.text, self.txtEventTime.text, self.txtEventLocation.text, self.txtEventDescription.text, self.txtEventVisible.text];
//    }
//    else{
//        query = [NSMutableString stringWithFormat:@"update eventsTable set event_name='%@', event_date='%@', event_time='%@', event_location='%@', event_description='%@', event_visible='%@' where ID=%d", self.txtEventName.text, self.txtEventDate.text, self.txtEventTime.text, self.txtEventLocation.text, self.txtEventDescription.text, self.txtEventVisible.text, self.recordIDToEdit];
//    }
//    // Execute the query.
//    [self.dbManager executeQuery:query];
//    
//    // If the query was successfully executed then pop the view controller.
//    if (self.dbManager.affectedRows != 0) {
//        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
//        
//        // Inform the delegate that the editing was finished.
//        [self.delegate editingInfoWasFinished];
//        
//        // Pop the view controller.
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//    else{
//        NSLog(@"Could not execute the query.");
//    }
//}

//
//@end
