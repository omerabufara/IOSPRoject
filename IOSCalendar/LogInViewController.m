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
#import "SignInSuccessViewController.h"


@interface LogInViewController ()

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

-(IBAction)login:(id)sender{
    CalendarViewController *cal = [[CalendarViewController alloc]init];

    if([[self.userName text] isEqualToString:@"Admin"] && [[self.password text] isEqualToString:@"12345"] ) {
        cal.userIDSignedIn = self.userName.text;
        self.usernameFound = self.userName.text;
        
        //[self performSegueWithIdentifier:@"a" sender:self];
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
       SignInSuccessViewController *myViewController = (SignInSuccessViewController *) [story instantiateViewControllerWithIdentifier:@"signInSuccess"];
        
        [self presentViewController:myViewController animated:YES completion:nil];
        
        
    }
    else{
        HomeModel *logIn = [[HomeModel alloc]init];
        [logIn checkUser:self.userName.text pass:self.password.text ];
    }
    
}

- (void) loginFunctionality: (NSString *)found{
    
    CalendarViewController *cal = [[CalendarViewController alloc]init];
    
    self.userFound = found;
    
    if([found isEqualToString:@"1"]){
        
        //cal.userIDSignedIn = self.userName.text;
        self.usernameFound = self.userName.text;
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        SignInSuccessViewController *myViewController = (SignInSuccessViewController *) [story instantiateViewControllerWithIdentifier:@"signInSuccess"];
        
        UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        [top presentViewController:myViewController animated:YES completion: nil];
    }
    
    else{
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"Invalid Access"
                                                              delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alertsuccess show];
    }
    
    
}

@end

