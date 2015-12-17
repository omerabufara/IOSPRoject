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
    self.userName.delegate = self;
    self.userName.autocorrectionType = UITextAutocorrectionTypeNo;
    self.password.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)login:(id)sender{
    self.usernameFound = self.userName.text;

    if([[self.userName text] isEqualToString:@"Admin"] && [[self.password text] isEqualToString:@"12345"] ) {
        [[NSUserDefaults standardUserDefaults] setObject:self.usernameFound forKey:@"usernameSaved"];
        [[NSUserDefaults standardUserDefaults] synchronize];
       
        SignInSuccessViewController *myViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"signInSuccess"];
        
        
        //UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        //[top presentViewController:myViewController animated:YES completion: nil];
        [self presentViewController:myViewController animated:YES completion: nil];
        
        
    }
    else{
        HomeModel *logIn = [[HomeModel alloc]init];
        logIn.delegateVC = self;
        [logIn checkUser:self.userName.text pass:self.password.text];
    }
    
}

- (void) loginFunctionality: (NSString *)found username: (NSString*)usernameFound{
    
    self.usernameFound = usernameFound;
    self.userFound = found;
    
    if([found isEqualToString:@"1"]){
        
        [[NSUserDefaults standardUserDefaults] setObject:self.usernameFound forKey:@"usernameSaved"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
        SignInSuccessViewController *myViewController = (SignInSuccessViewController *) [story instantiateViewControllerWithIdentifier:@"signInSuccess"];
        //doesn't present on the calendar sign in link
        UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        [top presentViewController:myViewController animated:YES completion: nil];
        //[self presentViewController:myViewController animated:YES completion: nil];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"Invalid Access"
                                                              delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }
    
    
}

@end

