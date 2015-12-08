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

@synthesize foundUsername = _foundUsername;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithUserName:(NSString *)aUserName {
    self = [super init];
    if (self) {
        [self setFoundUsername:aUserName];
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"signInCalendar"]) {
        
        UINavigationController *navController = [segue destinationViewController];
        CalendarViewController *controller = (CalendarViewController *)([navController viewControllers][0]);        [controller setUserIDSignedIn:self.foundUsername];
    }
}


@end
