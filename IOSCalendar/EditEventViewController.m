//
//  EditEventViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "EditEventViewController.h"
#import "DBManager.h"


@interface EditEventViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation EditEventViewController

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

- (IBAction)saveInfo:(id)sender{
    // Prepare the query string.
    NSString *query = [NSString stringWithFormat:@"insert into eventsTable values(null,'%@', '%@', '%@', '%@', '%@', '%@')", self.txtEventName.text, self.txtEventDate.text, self.txtEventTime.text, self.txtEventLocation.text, self.txtEventDescription.text, self.txtEventVisible.text];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
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
