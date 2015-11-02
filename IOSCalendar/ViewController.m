//
//  ViewController.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/1/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSUInteger numDays;
NSInteger thisYear;
NSInteger weekday;
NSInteger thisMonth;
NSInteger thisday;



@implementation ViewController
@synthesize monthly;
@synthesize year;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self myCalView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)nextAct:(id)sender {
    thisMonth++;
    [self removeTags];
    [self updateCalNow];
}

- (IBAction)prevAct:(id)sender {
    thisMonth--;
    [self removeTags];
    [self updateCalNow];
}

-(void) removeTags{
    int x=1;
    while (x<=31){
        [[self.view viewWithTag:x] removeFromSuperview];
        x++;
    }
    
}

-(NSUInteger)getCurrDateInfo:(NSDate *)myDate{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return numberOfDaysInMonth;
}

-(void)myCalView{
    
    
    thisYear = [[[NSCalendar currentCalendar]
                 components:NSCalendarUnitYear fromDate:[NSDate date]]
                year];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps2 = [cal components:NSCalendarUnitMonth fromDate:[NSDate date]];
    thisMonth=[comps2 month];
    
    thisday = [[[NSCalendar currentCalendar]
                components:NSCalendarUnitDay fromDate:[NSDate date]]
               day];
    
    
    [self moreDateInfo];
    
}

-(void)updateCalNow{// try to condense this so only one method is used instead of two
    if(thisMonth>12){
        thisMonth=1;
        thisYear++;
    }
    
    if(thisMonth<1){
        thisMonth=12;
        thisYear--;
    }
    
    [self moreDateInfo];
}

-(void)moreDateInfo{
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //get first day of month's weekday
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:thisday];
    [components setMonth:thisMonth];
    [components setYear:thisYear];
    NSDate * newDate = [calendar dateFromComponents:components];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:newDate];
    weekday=[comps weekday];
    
    
    //Get number of days in the month
    numDays= [self getCurrDateInfo:newDate];
    
    
    int newWeekDay = weekday-1;       //make weekday zero based
    
    // NSLog(@"Day week %d",newWeekDay);
    
    //coordinates for displaying the buttons
    int yVal=175;
    int yCount=1;
    
    
    //Display name of month and year
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLog(@"%@",[[formatter monthSymbols] objectAtIndex:(thisMonth - 1)]);
    monthly.text =[[formatter monthSymbols] objectAtIndex:(thisMonth - 1)];
    year.text = [NSString stringWithFormat: @"%ld",thisYear] ;
    
    
    
    //use for loop to display each day
    
    for(int startD=1; startD<=numDays;startD++){
        UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        addProject.tag = startD;
    
        int xCoord=(newWeekDay*40)+15;
        int yCoord=(yCount*30)+yVal;
        
        newWeekDay++;
        if(newWeekDay>6){//drops buttons on y axis every 7 days
            newWeekDay=0;
            yCount++;
        }
        
        //Creates the buttons and gives them each a tag (id)
        //int popInt=startD;
        addProject.frame = CGRectMake(xCoord, yCoord, 35, 25);
        [addProject setTitle:[NSString stringWithFormat:@"%d", startD] forState:UIControlStateNormal];
        [addProject setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        addProject.tag = startD;
        
        
        addProject.backgroundColor = [UIColor grayColor];
        
        
        [self.view addSubview:addProject];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
