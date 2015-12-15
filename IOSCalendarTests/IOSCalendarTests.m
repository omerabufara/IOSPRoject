//
//  IOSCalendarTests.m
//  IOSCalendarTests
//
//  Created by Omer Abufara on 11/1/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Location.h"
#import "HomeModel.h"
#import "CalendarViewController.h"
#import "AddEventViewController.h"
#import "EditEventViewController.h"

@interface IOSCalendarTests : XCTestCase
{

        
        CalendarViewController *calendarView;
        HomeModel *hmodel;
        Location *loc;
        AddEventViewController *add;
        EditEventViewController *edit;
        
        NSInteger thismonth;
        NSInteger thisyear;
        
    


}

@end

@implementation IOSCalendarTests

- (void)setUp {
    [super setUp];
    
    calendarView = [[CalendarViewController alloc]init];
    hmodel = [[HomeModel alloc]init];
    loc = [[Location alloc]init];
    add =[[AddEventViewController alloc]init];
    edit = [[EditEventViewController alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
-( void)testAddEvent
{
    
    add.txtEventName = (UITextField * )@"EventName";
    XCTAssertTrue([add.txtEventName isEqual:add.txtEventName]);
    
    add.txtEventDate = (UITextField * )@"December-20-2015";
    XCTAssertTrue([add.txtEventDate isEqual:add.txtEventDate]);
    
    add.txtEventTime = (UITextField * )@"3:00";
    XCTAssertTrue([add.txtEventTime isEqual:add.txtEventTime]);
    
    add.txtEventLocation = (UITextField * )@"Here";
    XCTAssertTrue([add.txtEventLocation isEqual:add.txtEventLocation]);
    
    add.txtEventDescription = (UITextField * )@"Consultant";
    XCTAssertTrue([add.txtEventDescription isEqual:add.txtEventDescription]);
    
    
}

-(void)testEditEvent {
    
    edit.txtEventName = (UITextField * )@"EventName";
    XCTAssertTrue([edit.txtEventName isEqual:@"EventName"]);
    
    edit.txtEventTime = (UITextField * )@"3:00";
    XCTAssertTrue([edit.txtEventTime isEqual:@"3:00"]);
    
    edit.txtEventLocation = (UITextField * )@"There";
    XCTAssertTrue([edit.txtEventLocation isEqual:@"There"]);
    
    edit.txtEventDescription = (UITextField * )@"Consultant";
    XCTAssertTrue([edit.txtEventDescription isEqual:@"Consultant"]);
    
    
    
    
    
}

-(void)testLocation
{
    
    loc.eventId = @"18";
    XCTAssertTrue([loc.eventId isEqual:loc.eventId]);
    
    loc.event_name = @"EventName";
    XCTAssertTrue([loc.event_name isEqual:loc.event_name]);
    
    if ([loc.event_date  isEqual: @"December-20-2015"]) {
        XCTAssertTrue([loc.event_date isEqual:@"December-20-2015"]);
        
    }
    
    else
        
        
        XCTAssertFalse([loc.event_date isEqual:@"December-20-2015"]);
    
    
    
    
    
    //    loc.event_date = @"December-20-2015";
    //
    //    XCTAssertFalse([loc.event_date  isEqual :@"December-20-2015"]);
    //
    //    XCTAssertFalse([loc.event_date isEqual:@"December-20-2015"]);
    
    loc.event_time = @"EventName";
    XCTAssertTrue([loc.event_time isEqual:loc.event_time]);
    
    loc.event_location = @"EventName";
    XCTAssertTrue([loc.event_location isEqual:loc.event_location]);
    
    loc.event_description = @"EventName";
    XCTAssertTrue([loc.event_description isEqual:loc.event_description]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
