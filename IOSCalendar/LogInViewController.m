//
//  LogInViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "LogInViewController.h"
#import "EditEventViewController.h"
#import "CalendarViewController.h"


@interface LogInViewController ()

@end

@implementation LogInViewController

bool usernameExist;
bool passwordcorrect;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)login:(id)sender {
    if([[self.userName text] isEqualToString:@"admin"] || [[self.password text] isEqualToString:@"123"] ) {
        NSLog(@"admin login make the sign in sign up button desaper , make the add manage edit button appear");
        [self performSegueWithIdentifier:@"" sender:self];
    }else{
        //alert message should go here
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"User Name or password not correct"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
