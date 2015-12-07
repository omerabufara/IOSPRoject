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
#import "SingInSuccessViewController.h"

@interface LogInViewController ()
    
    @property NSString* userfnd;
    @property NSString* userFound;


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
    
    if([[self.userName text] isEqualToString:@"Admin"] && [[self.password text] isEqualToString:@"12345"] ) {
        
        
        //[self performSegueWithIdentifier:@"a" sender:self];
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        CalendarViewController *myViewController = (CalendarViewController *) [story instantiateViewControllerWithIdentifier:@"calendarView"];
        
        [self presentViewController:myViewController animated:YES completion:nil];
        
    }
    else{
        HomeModel *logIn = [[HomeModel alloc]init];
        [logIn checkUser:self.userName.text pass:self.password.text ];
    }

}
- (void) loginFunctionality: (NSString *)found{

    self.userFound = found;
    
    if([found isEqualToString:@"1"]){
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        SingInSuccessViewController *myViewController = (SingInSuccessViewController *) [story instantiateViewControllerWithIdentifier:@"signInSuccess"];
        
        UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        [top presentViewController:myViewController animated:YES completion: nil];
        }
    
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error1" message:@"Username or password is invalid" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
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



