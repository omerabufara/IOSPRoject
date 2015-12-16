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
#import "UIViewController+MJPopupViewController.h"
#import "EditEventViewController.h"
#import "ThankYouViewController.h"
#import "deleteFinishViewController.h"

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
    
    self.eName = eventName;
    self.eTime = eventtime;
    self.eLocation = eventLoc;
    self.eDesc = eventDes;
}

- (IBAction)deletePressed:(id)sender{
    [self deleteEvent:storedRecordId];
    //[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    //[self dismissPopupViewControllerWithanimation:sender];
}

-(IBAction)editPressed:(id)sender{
    
    //EditEventViewController *edit = [[EditEventViewController alloc]init];
//       [edit loadInfoToEdit:&storedRecordId name:storeEventName time:storeEventTime location:storeEventLocation description:storeEventDescribe];
//    CalendarViewController *vc = [[CalendarViewController alloc]init];
//    [vc showEditPage];
    //[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    //[self dismissPopupViewControllerWithanimation:sender];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    EditEventViewController *yourViewController = (EditEventViewController *)[storyboard instantiateViewControllerWithIdentifier:@"editPage"];
    
    [self presentViewController:yourViewController animated:YES completion:nil];
    
    [yourViewController loadInfoToEdit:&storedRecordId name:storeEventName time:storeEventTime location:storeEventLocation description:storeEventDescribe];


}

-(void)deleteEvent:(NSInteger)recordId{
    HomeModel *delete = [[HomeModel alloc]init];
    
    [delete deleteItems:&recordId];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    deleteFinishViewController *myViewController = (deleteFinishViewController *) [story instantiateViewControllerWithIdentifier:@"deleteFinish"];
    [self presentViewController:myViewController animated:YES completion:Nil];
    
    
}

- (IBAction)registerPressed:(id)sender {
    NSString *usernameStored = [[NSUserDefaults standardUserDefaults]stringForKey:@"usernameSaved"];
    
    HomeModel * registration = [[HomeModel alloc]init];
    
    [registration registration:storeEventName username:usernameStored];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ThankYouViewController *myViewController = (ThankYouViewController *) [story instantiateViewControllerWithIdentifier:@"thankyou"];
    [self presentViewController:myViewController animated:YES completion:Nil];
    
    
    
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
