//
//  MJDetailViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/21/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
// pop

#import <UIKit/UIKit.h>


@interface MJDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *eventTime;
@property (weak, nonatomic) IBOutlet UILabel *eventLocation;
@property (weak, nonatomic) IBOutlet UILabel *eventDescription;

@end
