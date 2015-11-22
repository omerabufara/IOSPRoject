//
//  MJDetailViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/21/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "MJDetailViewController.h"
#import "CalendarViewController.h"

@interface MJDetailViewController ()

@end

@implementation MJDetailViewController
@synthesize eventName;
@synthesize eventDate;
@synthesize eventTime;
@synthesize eventLocation;
@synthesize eventDescription;

- (void)viewDidLoad {
    [super viewDidLoad];
    eventTime.text=parseSpot3[2];
    eventLocation.text=parseSpot3[3];
    eventDescription.text=parseSpot3[4];
    
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

@end
