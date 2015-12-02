//
//  eventsTableViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/17/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface eventsTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol>


@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end
