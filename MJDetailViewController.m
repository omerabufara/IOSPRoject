//
//  MJDetailViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/21/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "MJDetailViewController.h"
#import "CalendarViewController.h"
#import "HomeModel.h"
#import "EditEventViewController.h"

@interface MJDetailViewController ()

@end
NSInteger storedRecordId;
NSString *storeEventName;
NSString *storeEventTime;
NSString *storeEventLocation;
NSString *storeEventDescribe;
@implementation MJDetailViewController
@synthesize eventTime;
@synthesize eventLocation;
@synthesize eventDescription;

- (void)viewDidLoad {
    [super viewDidLoad];
    eventTime.text=parseSpot3[2];
    eventLocation.text=parseSpot3[3];
    eventDescription.text=parseSpot3[4];
//    eventTime.text=@"3:00 pm";
//        eventLocation.text=@"4100 Fleetwood Drive West Mifflin, PA 15122";
//     //[eventDescription setLineBreakMode:NSLineBreakByWordWrapping];
//        eventDescription.text=@"This is a test of how much I can type within this box before it starts to run over. This needs to be word wrapped so it doesn't go off of the screen. Or it would look stupid";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)storeRecordId:(NSInteger)recordId name: (NSString*)eventName time:(NSString*)eventtime location:(NSString*)eventLoc description:(NSString*)eventDes {
    storedRecordId = recordId;
    storeEventName = eventName;
    storeEventTime = eventtime;
    storeEventLocation = eventLoc;
    storeEventDescribe = eventDes;
}

- (IBAction)deletePressed:(id)sender{
    [self deleteEvent:storedRecordId];
    //[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    [self dismissPopupViewControllerWithanimation:sender];
}

-(IBAction)editPressed:(NSInteger)sender{
    
    EditEventViewController *edit = [[EditEventViewController alloc]init];
       [edit loadInfoToEdit:&storedRecordId name:storeEventName time:storeEventTime location:storeEventLocation description:storeEventDescribe];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditEventViewController *yourViewController = (EditEventViewController *)[storyboard instantiateViewControllerWithIdentifier:@"editPage"];
    [self.navigationController pushViewController:yourViewController animated:YES];
    
    
 

}

-(void)deleteEvent:(NSInteger)recordId{
    HomeModel *delete = [[HomeModel alloc]init];
    
    [delete deleteItems:&recordId];
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
