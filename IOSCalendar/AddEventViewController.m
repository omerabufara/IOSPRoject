//
//  AddEventViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()


@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *eventDate;
@property (weak, nonatomic) IBOutlet UITextField *eventTime;
@property (weak, nonatomic) IBOutlet UITextField *eventLocation;
@property (weak, nonatomic) IBOutlet UITextField *eventDescription;


@end

@implementation AddEventViewController


- (void)setEventDetail:(id)newDetailItem {
    if (_eventDetail != newDetailItem) {
        _eventDetail = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.eventDetail) {
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];

}


-(void)viewWillAppear:(BOOL)animated {
    if(self.eventDetail) {
        self.eventName.text = self.eventDetail.eventName;
        self.eventDate.text = self.eventDetail.eventDate;
        self.eventTime.text = self.eventDetail.eventTime;
        self.eventLocation.text = self.eventDetail.eventLocation;
        self.eventDescription.text = self.eventDetail.eventDescription;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelAdd:(id)sender {
    
}

- (IBAction)saveAdd:(id)sender {
    
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
