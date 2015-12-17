//
//  CalendarViewController.m
//  IOSCalendar
//
//  Created by Moran, Jennifer on 11/3/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "CalendarViewController.h"
#import "AddEventViewController.h"
#import "EditEventViewController.h"
#import "AppDelegate.h"
#import "Location.h"
#import "UIViewController+MJPopupViewController.h"
#import "MJDetailViewController.h"
#import "LogInViewController.h"


@interface CalendarViewController () <EditInfoViewControllerDelegate>



@property (nonatomic, strong) NSArray *eventsArray;

@property (nonatomic) int recordIDToEdit;


@end

@interface CalendarViewController()
{
    HomeModel *_homeModel;
    NSArray *_feedItems;
    
}
@end

NSUInteger numDays;
NSInteger thisYear;
NSInteger weekday;
NSInteger thisMonth;
NSInteger thisday;

NSArray * parseSpot3;

@implementation CalendarViewController

@synthesize monthly;
@synthesize year;
@synthesize currentButtonTitle;


- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
        
    UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    addButton.tag = 200;
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.addEventViewController = (AddEventViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self myCalView];
    
    self.calendarTableView.delegate = self;
    self.calendarTableView.dataSource = self;
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    UIButton *button = (UIButton *)[self.view viewWithTag:day];
    
    
    
    [self loadData:button];

}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    self.itemsDownloaded = items;
    
    // Reload the table view
    [self.calendarTableView reloadData];
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

-(void)updateCalNow{
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
    NSDateComponents *currentDate = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currDay = [currentDate day];
    NSInteger currMonth = [currentDate month];
    NSInteger currYear = [currentDate year];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //get first day of month's weekday
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    [components setMonth:thisMonth];
    [components setYear:thisYear];
    NSDate * newDate = [calendar dateFromComponents:components];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:newDate];
    weekday=[comps weekday];
    
    
    //Get number of days in the month
    numDays= [self getCurrDateInfo:newDate];
    
    
    int newWeekDay = weekday-1;       //make weekday zero based
    
    // NSLog(@"Day week %d",newWeekDay);
    
    
//    CGPoint midPoint;
//    midPoint.x = self.view.bounds.origin.x + self.view.bounds.size.width /2;
    
    //self.bounds.size.width /2;
    
    //coordinates for displaying the buttons
    int yVal=220;
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
        
        int xCoord =(newWeekDay*40) + 15; //(self.view.bounds.origin.x + self.view.bounds.size.width/2);
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
        
        [addProject addTarget:self
                       action:@selector(showEvents:)
             forControlEvents:UIControlEventTouchUpInside];
        //[self loadData: addProject];
        
        if(currMonth == thisMonth && currYear == thisYear && currDay == [[addProject.currentTitle stringByReplacingOccurrencesOfString:@" " withString:@""] intValue]){
            
            
            addProject.backgroundColor = [UIColor blueColor];
        }
        else{
            addProject.backgroundColor = [UIColor grayColor];
        }
        
        [self.view addSubview:addProject];
    }
    
    
}




-(IBAction)showEvents:(id)sender{
    [self loadData:sender];
    self.dayPressed = sender;
}

- (IBAction)addNewEvent:(id)sender{
   
    [self performSegueWithIdentifier:@"addEventSegue" sender:self];
    
}

-(void)loadData:(id)sender{
    NSString *usernameStored = [[NSUserDefaults standardUserDefaults]
                                                       stringForKey:@"usernameSaved"];
    
    if([sender isKindOfClass:[UIButton class]]){
        UIButton *senderButton = sender;
        // Unselect all the buttons in the parent view
        for (UIView *button in senderButton.superview.subviews) {
            if ([button isKindOfClass:[UIButton class]]) {
                [(UIButton *)button setSelected:NO];
            }
        }
        
        // Set the current button as the only selected one
        [sender setSelected:YES];
    }
    
    if (sender != nil)
    {
        

        NSString *day = [sender currentTitle];
        currentButtonTitle = day;
        self.senderDate = self.monthly.text;
        self.senderDate = [self.senderDate stringByAppendingString:@"-"];
        self.senderDate = [self.senderDate stringByAppendingString:day];
        self.senderDate = [self.senderDate stringByAppendingString:@"-"];
        self.senderDate = [self.senderDate stringByAppendingString:self.year.text];
        _feedItems = [[NSArray alloc]init];
        _homeModel = [[HomeModel alloc]init];
        _homeModel.delegate = self;
        if(![usernameStored isEqualToString: @""]){
        
            UIButton *signIn = (UIButton *)[self.view viewWithTag:50];
            UIButton *signUp = (UIButton *)[self.view viewWithTag:51];
            signIn.hidden = YES;
            signUp.hidden = YES;
            UIButton *logout = (UIButton *)[self.view viewWithTag:205];
            logout.hidden = NO;
        
            if([usernameStored isEqualToString:@"Admin"]){
                UIButton *postedDay = (UIButton *)[self.view viewWithTag:52];
                postedDay.hidden = NO;
                UIButton *postedMonth = (UIButton *)[self.view viewWithTag:53];
                postedMonth.hidden = NO;
                [_homeModel downloadItems:day monthly:self.monthly.text year:self.year.text];
            }
            else {
                UIButton *postedDay = (UIButton *)[self.view viewWithTag:52];
                postedDay.hidden = YES;
                UIButton *postedMonth = (UIButton *)[self.view viewWithTag:53];
                postedMonth.hidden = YES;
                self.navigationItem.rightBarButtonItem = nil;
                //need to hide add & edit on details
               [_homeModel downloadItemsUser:day monthly:self.monthly.text year:self.year.text];
            }
        }
        else{
            UIButton *postedDay = (UIButton *)[self.view viewWithTag:52];
            postedDay.hidden = YES;
            UIButton *postedMonth = (UIButton *)[self.view viewWithTag:53];
            postedMonth.hidden = YES;
            self.navigationItem.rightBarButtonItem = nil;
            self.navigationItem.leftBarButtonItem = nil;
            //need to hide add, edit & register on details
            
           [_homeModel downloadItemsUser:day monthly:self.monthly.text year:self.year.text];
        }
        
    }

    
    // Get the results.
    if (self.eventsArray != nil) {
        self.eventsArray = nil;
    }
    
    // Reload the table view.
    [self.calendarTableView reloadData];
    
}
- (void)insertNewObject:(id)sender {
    
    if (!self.calendarTableView) {
        _homeModel= [[HomeModel alloc]init];
    }
    AddEventViewController *foundDVC = (AddEventViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"add"];
    
    if ([foundDVC respondsToSelector:@selector(setDelegate:)]) {
        [foundDVC setDelegate:self];
    }
    [self.navigationController pushViewController:foundDVC animated:YES];
    
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{

    self.recordIDToEdit = [[[self.eventsArray objectAtIndex:indexPath.row] objectAtIndex:0] intValue];

    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _feedItems.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Location *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    UILabel *title = [myCell.contentView viewWithTag:2];
    title.text = item.event_name;
    
    UILabel *subtitle = [myCell.contentView viewWithTag:100];
    subtitle.text = item.event_time;
    
    //self.cellSubtitle.text = item.event_time;
     UILabel *posted = [myCell.contentView viewWithTag:1];
    
    if([item.posted  isEqual: @"t"]){
        posted.hidden = NO;
    }
    else{
        posted.hidden = YES;
    }

    return myCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MJDetailViewController *detailVC =[[MJDetailViewController alloc]init];
    Location *item = _feedItems[indexPath.row];
    NSLog(@"here");
    
     [detailVC storeRecordId:[[item.eventId stringByReplacingOccurrencesOfString:@" " withString:@""]intValue] name:item.event_name time:item.event_time location:item.event_location description:item
      .event_description];
    
    [self popupInfo:item.event_name date:item.event_date time:item.event_time location:item.event_location description:item.event_description];
}

/// Delete Records


//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the selected record.
//        // Find the record ID.
//        
//        Location *item = _feedItems[indexPath.row];
//        
//        
//        
//        NSInteger recordIDToDelete = [[item.eventId stringByReplacingOccurrencesOfString:@" " withString:@""] intValue];
//        
//        HomeModel *delete = [[HomeModel alloc]init];
//        
//        [delete deleteItems:&recordIDToDelete];
//      
//         //Reload the table view.
//        [self loadData:nil];
//    }
//}

-(void)editingInfoWasFinished{
    // Reload the data.
    [self loadData: nil];
}


-(void) popupInfo: (NSString*) evName date:(NSString*)evDate time:(NSString*)evTime location:(NSString*)evLocation description:(NSString*)evDescription {
    NSLog(@"POPUPINFO");
    
    NSString *usernameStored = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"usernameSaved"];
    
    parseSpot3=@[evName,evDate,evTime,evLocation,evDescription];
    //compare above date to parse database. See if current user has an entry
    
    
    //   ----- Launch a  POPUP SCREEN -----------
    
    
    MJDetailViewController *detailViewController = [[MJDetailViewController alloc] initWithNibName:@"MJDetailViewController" bundle:nil];
    if(![usernameStored isEqualToString: @""]){
        if([usernameStored isEqualToString:@"Admin"]){
            UIButton *delete = [detailViewController.view viewWithTag:201];
            delete.hidden = NO;
            UIButton *edit = [detailViewController.view viewWithTag:202];
            edit.hidden = NO;
            UIButton *registerbutton = [detailViewController.view viewWithTag:203];
            registerbutton.hidden = NO;
        }
        else{
            UIButton *delete = [detailViewController.view viewWithTag:201];
            delete.hidden = YES;
            UIButton *edit = [detailViewController.view viewWithTag:202];
            edit.hidden = YES;
        }
    }
    else{
        UIButton *delete = [detailViewController.view viewWithTag:201];
        delete.hidden = YES;
        UIButton *edit = [detailViewController.view viewWithTag:202];
        edit.hidden = YES;
        UIButton *registerbutton = [detailViewController.view viewWithTag:203];
        registerbutton.hidden = YES;
    }
    
    [self presentPopupViewController:detailViewController animationType:MJPopupViewAnimationFade];
    
    
}

-(IBAction)postEventsDay:(id)sender{
    AddEventViewController *addVC = [[AddEventViewController alloc]init];
    [addVC postEventsDay:self.senderDate];
    [self loadData:self.dayPressed];
}

-(IBAction)postEventsMonth:(id)sender{
    AddEventViewController *addVC = [[AddEventViewController alloc]init];
    [addVC postEventsMonth:self.senderDate];
    //not working for by month
    [self loadData:self.dayPressed];
}

-(IBAction)logoutUser:(id)sender{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"usernameSaved"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(IBAction)showSignInPage:(id)sender{
//    LogInViewController *myViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"signIn"];
//    
//    
//    UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
//    [top presentViewController:myViewController animated:YES completion:nil];
}

@end
