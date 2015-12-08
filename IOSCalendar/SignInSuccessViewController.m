//
//  SignInSuccessViewController.m
//  IOSCalendar
//
//  Created by Jennifer Moran on 12/7/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "SignInSuccessViewController.h"
#import "CalendarViewController.h"

@interface SignInSuccessViewController ()

@end

@implementation SignInSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.foundUsername = @"Admin";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"signInCalendar"]) {
//        
//         CalendarViewController *controller = (CalendarViewController *)segue.destinationViewController;
//        controller.userIDSignedIn = self.foundUsername;
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
