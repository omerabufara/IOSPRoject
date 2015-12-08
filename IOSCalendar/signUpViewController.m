//
//  signUpViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "signUpViewController.h"
#import "DBManager.h"
#import "HomeModel.h"
@interface signUpViewController ()

@end

@implementation signUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signup:(id)sender {
    
    HomeModel *addUser = [[HomeModel alloc]init];
    
    NSString *firstName = self.first_name.text;
    
    NSString *lastName = self.last_name.text;
    
    NSString *email = self.email_address.text;
    
    NSString *phoneNo = self.cellPhone.text;
    
    NSString *userName = self.user_name.text;
    
    NSString *password = self.password.text;
    
    
    
    
    
    [addUser addUsers:firstName lName:lastName mail:email cell:phoneNo Uname:userName psw:password ];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"users successfully signed up");
    
    
}
@end
