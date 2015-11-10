//
//  AddEventViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@protocol AddEventViewControllerDelegate;

@interface AddEventViewController : UIViewController


@property (strong, nonatomic) Event *eventDetail;
@property (nonatomic, weak) id <AddEventViewControllerDelegate> delegate;

@end


@protocol AddEventViewControllerDelegate <NSObject>

- (void)detailControllerSaved:(AddEventViewController *) controller;
- (void)detailControllerCanceled:(AddEventViewController *) controller;

@end