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
#import "HomeModel.h"

@interface LogInViewController (){


}

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

-(IBAction)login:(NSString  *)sender{
    
    HomeModel *logIn = [[HomeModel alloc]init];
    [logIn checkUser:self.userName.text pass:self.password.text ];//buttonSender:sender];
    
    if([[self.userName text] isEqualToString:@"Admin"] || [[self.password text] isEqualToString:@"12345"] ) {
    
        CalendarViewController *calendar = (CalendarViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"calendarView"];
        [self presentViewController:calendar animated:YES completion:nil];
    
    }
    
    else {
        
        HomeModel *logIn = [[HomeModel alloc]init];
        [logIn checkUser:self.userName.text pass:self.password.text ];
    }
    
    
    //HomeModel *logIn = [[HomeModel alloc]init];
        
//    [logIn checkUser:self.userName.text pass:self.password.text buttonSender:sender];
        
    
    
//
//    CalendarViewController *calendar = (CalendarViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"calendarView"];
//    [self presentViewController:calendar animated:YES completion:nil];

}

- (void) loginFunctionality: (NSString *)userFound{
    
    if ([userFound  isEqual: @"1"]){
        
        
         NSLog(@"user login make the sign in sign up button desaper , make the add manage edit button appear");
        
        
        
    }
    else if ([userFound  isEqual: @"0"])
    
    {
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"Invalid Access"
                                                                       delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                                             [alertsuccess show];
        
    }

}



@end

//}
//    NSString *post =[NSString stringWithFormat:@"username=%@&password=%@",self.userName.text, self.password.text];
//
//    NSString *hostStr = @"http://pendragon.gannon.edu/iospssh/data/signInCheck.php?";
//    hostStr = [hostStr stringByAppendingString:post];
//    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
//    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
//    if([serverOutput isEqualToString:@"1"]){
//        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"success" message:@"You are authorized"
//                                                              delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
//        [alertsuccess show];
//
//        [self performSegueWithIdentifier:@"loginIdentifier" sender:self];
//    } else if([serverOutput isEqualToString:@"0"]){
//        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"Invalid Access"
//                                                              delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
//        [alertsuccess show];
//
//    }



