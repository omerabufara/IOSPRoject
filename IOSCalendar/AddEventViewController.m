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
    
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    
    self.txtEventName.delegate = self;
    self.txtEventDate.delegate = self;
    self.txtEventTime.delegate = self;
    self.txtEventLocation.delegate = self;
    self.txtEventDescription.delegate = self;
    self.txtEventVisible.delegate = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"PSSH.sql"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveInfo:(id)sender{
    // Prepare the query string.
    NSMutableString *query = [NSMutableString stringWithFormat:@"insert into eventsTable values (null ,'%@' , '%@' , '%@' , '%@' , '%@' , '%@' )", self.txtEventName.text, self.txtEventDate.text, self.txtEventTime.text, self.txtEventLocation.text, self.txtEventDescription.text, self.txtEventVisible.text];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
       
         [self.delegate editingInfoWasFinished];
        [self.navigationController popViewControllerAnimated:YES];
        //[self dismissViewControllerAnimated:YES completion:nil];
      
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}

@end
