//
//  CalendarViewController.m
//  IOSCalendar
//
//  Created by Moran, Jennifer on 11/3/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "CalendarViewController.h"
#import "AddEventViewController.h"
#import "DBManager.h"

@interface CalendarViewController () <AddProtocols>

@property (weak, nonatomic) IBOutlet UITableView *calendarTableView;

@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *eventsArray;


-(void)loadData;

@end

NSUInteger numDays;
NSInteger thisYear;
NSInteger weekday;
NSInteger thisMonth;
NSInteger thisday;



@implementation CalendarViewController

@synthesize monthly;
@synthesize year;
@synthesize eventsArray = _eventsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self myCalView];
    self.eventsArray = [[NSMutableArray alloc]init];
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"iOSPSSH.sql.SQLite"];
    
    [self loadData];
    
    //self.eventsArray = [[NSMutableArray alloc]initWithObjects:@"Event1",@"Event2",@"Event3", nil];
    // Do any additional setup after loading the view, typically from a nib.
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
    return [self.eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    
    NSString *cellValue = [self.eventsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;*/
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSInteger indexOfEventName = [self.dbManager.arrColumnNames indexOfObject:@"event_name"];
    NSInteger indexOfEventDate = [self.dbManager.arrColumnNames indexOfObject:@"event_date"];
    NSInteger indexOfEventTime = [self.dbManager.arrColumnNames indexOfObject:@"event_time"];
    NSInteger indexOfEventLocation = [self.dbManager.arrColumnNames indexOfObject:@"event_location"];
    NSInteger indexOfEventDescription = [self.dbManager.arrColumnNames indexOfObject:@"event_description"];
    
    // Set the loaded data to the appropriate cell labels.
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.eventsArray objectAtIndex:indexPath.row] objectAtIndex:indexOfEventName]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Time: %@", [[self.eventsArray objectAtIndex:indexPath.row] objectAtIndex:indexOfEventTime]];
    
    return cell;
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
        
        if(currMonth == thisMonth && currYear == thisYear && currDay == [[addProject.currentTitle stringByReplacingOccurrencesOfString:@" " withString:@""] intValue]){
            addProject.backgroundColor = [UIColor blueColor];
            //how to click current date button so events show up???????????
            //when you do this, may be able to but blueColor in click event showEvents because will turn whichever is clicked to blue
            [addProject sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
        else{
            addProject.backgroundColor = [UIColor grayColor];
        }
        
        
        
        [self.view addSubview:addProject];
    }
    
}

-(IBAction)showEvents:(id)sender{
    //will have to adjust this to show different events by date when we get to it
    NSLog(@"Events shown");
    /*[self.eventsArray removeAllObjects];
    [self.eventsArray addObject:@"Event 1"];
    [self.eventsArray addObject:@"Event 2"];
    [self.eventsArray addObject:@"Event 3"];
    [self.eventsArray addObject:@"Event 4"];*/
    NSLog(@"array count is : %lu", (unsigned long)[self.eventsArray count]);
    [self.calendarTableView reloadData];
}

- (void)addNewEvent:(id)sender{
   
    [self performSegueWithIdentifier:@"addEventSegue" sender:self];
    
}

-(void)loadData{
    // Form the query.
    NSString *query = @"select * from eventsTable";
    
    // Get the results.
    if (self.eventsArray != nil) {
        self.eventsArray = nil;
    }
    self.eventsArray = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    [self.calendarTableView reloadData];
}


@end
