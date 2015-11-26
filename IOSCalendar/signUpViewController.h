//
//  signUpViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *first_name;
@property (weak, nonatomic) IBOutlet UITextField *last_name;
@property (weak, nonatomic) IBOutlet UITextField *email_address;
@property (weak, nonatomic) IBOutlet UITextField *cellPhone;
@property (weak, nonatomic) IBOutlet UITextField *user_name;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)signup:(id)sender;

@end
