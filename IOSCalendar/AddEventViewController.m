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

@interface AddEventViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation AddEventViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    self.txtEventName.delegate = self;
    self.txtEventDate.delegate = self;
    self.txtEventTime.delegate = self;
    self.txtEventLocation.delegate = self;
    self.txtEventDescription.delegate = self;
    self.txtEventVisible.delegate = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"iOSPSSH.sql.SQLite"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    if(self.detailItem) {
        self.txtEventName.delegate = self.detailItem.txtEventName.delegate;
        self.txtEventDate.delegate = self.detailItem.txtEventDate.delegate;
        self.txtEventTime.delegate = self.detailItem.txtEventTime.delegate;
        self.txtEventLocation.delegate = self.detailItem.txtEventLocation.delegate;
        self.txtEventDescription.delegate = self.detailItem.txtEventDescription.delegate;
        self.txtEventVisible.delegate = self.detailItem.txtEventDescription.delegate;
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        [self viewWillAppear:YES];
        
    }
}

- (IBAction)saveInfo:(id)sender{
    // Prepare the query string.
    NSString *query = [NSString stringWithFormat:@"INSERT INTO eventsTable (event_name, event_date, event_time, event_location, event_description, event_visible) values ('%@' , '%@' , '%@' , '%@' , '%@' , '%@' )", self.txtEventName.text, self.txtEventDate.text, self.txtEventTime.text, self.txtEventLocation.text, self.txtEventDescription.text, self.txtEventVisible.text];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Pop the view controller.
//        [self.delegate reloadCalendarTable:self];
//        [self.navigationController popViewControllerAnimated:YES];
        
//        self.detailItem.txtEventName.delegate ;
//        self.detailItem.txtEventDate.delegate;
//        self.detailItem.txtEventTime.delegate;
//        self.detailItem.txtEventLocation.delegate;
//        self.detailItem.txtEventDescription.delegate;
//        self.detailItem.txtEventVisible.delegate;

        
        
//                           self.txtEventDate.delegate = self,
//                           self.txtEventTime.delegate = self,
//                           self.txtEventLocation.delegate = self,
//                           self.txtEventDescription.delegate = self,
//                           self.txtEventVisible.delegate = self ;
         [self.delegate reloadCalendarTable:self];
        [self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];

        
        
       
        
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
