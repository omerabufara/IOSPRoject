//
//  EditEventViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/6/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//
//
#import "EditEventViewController.h"
#import "CalendarViewController.h"
#import "AddEventViewController.h"
#import "DBManager.h"
#import "CalendarViewController.h"



@interface EditEventViewController ()
{

    NSInteger idEdit;
    
    NSInteger *saveID;
    NSString *saveName;
    NSString *saveTime;
    NSString *saveLocation;
    NSString *saveDescribtion;


}

//@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation EditEventViewController
//
////
- (void)viewDidLoad
{
   
    [super viewDidLoad];
    
    NSLog(@"here again");
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    
    self.txtEventName.delegate = self;
    self.txtEventTime.delegate = self;
    self.txtEventLocation.delegate = self;
    self.txtEventDescription.delegate = self;

}
////

-(void)loadInfoToEdit: (NSInteger*)recordid  name: (NSString*)eventName time:(NSString*)eventtime location:(NSString*)eventLoc description:(NSString*)eventDes {
    
    NSLog(@"here edit ");
    
    idEdit = *recordid;
    
    self.txtEventName.text = eventName;
    
    self.txtEventTime.text = eventtime;
    
    self.txtEventLocation.text = eventLoc;
    
    self.txtEventDescription.text = eventDes;

}

-(IBAction)saveEdit:(id)sender{
    
    //saveID = &idEdit;
    saveName = self.txtEventName.text;
    saveTime = self.txtEventTime.text;
    saveLocation = self.txtEventLocation.text;
    saveDescribtion = self.txtEventDescription.text;
    
    HomeModel *editRecord = [[HomeModel alloc]init];
    
    [editRecord edit:&idEdit name:saveName time:saveTime location:saveLocation description:saveDescribtion];
    
  [self.delegating addingInfoWasFinished];
    
//    editFinishViewController *edf = [[editFinishViewController alloc]init];
//    [self presentViewController:edf animated:YES completion:nil];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    editFinishViewController *yourViewController = (editFinishViewController *)[storyboard instantiateViewControllerWithIdentifier:@"editFinish"];
    
    [self presentViewController:yourViewController animated:YES completion:nil];
   // CalendarViewController *editF = [[CalendarViewController alloc]init];
    
    //[self.navigationController pushViewController:editF animated:YES];
//    [self.navigationController presentViewController:editF animated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];

    
}

@end

