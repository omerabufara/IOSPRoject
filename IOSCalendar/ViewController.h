//
//  ViewController.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/1/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

- (IBAction)nextAct:(id)sender;

- (IBAction)prevAct:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *monthly;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) NSDate *defaulComp;

@property (strong, nonatomic) NSMutableArray *eventsArray;


@end

