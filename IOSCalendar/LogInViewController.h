//
//  LogInViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *password;


@property (nonatomic, retain) NSString* usernameFound;
- (IBAction)login:(id)sender;


- (void)loginFunctionality: (NSString *)found;

@end
