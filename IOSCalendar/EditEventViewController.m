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
#import "editFinishViewController.h"
#import "HomeModel.h"
#import "Location.h"



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
    
  //[self.delegating addingInfoWasFinished];
//    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];

    //CalendarViewController *yourViewController = [[CalendarViewController alloc]init];

//    
//    [self presentViewController:yourViewController animated:YES completion:nil];
//    [yourViewController.navigationController pushViewController:yourViewController animated:YES];
//
//    editFinishViewController *edit = [[editFinishViewController alloc]init];
//    [self presentViewController:edit animated:YES completion:nil];
    //[self.navigationController pushViewController:yourViewController animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    editFinishViewController *yourViewController = (editFinishViewController *)[storyboard instantiateViewControllerWithIdentifier:@"editFinish"];
    
    [self presentViewController:yourViewController animated:YES completion:nil];

}

@end

