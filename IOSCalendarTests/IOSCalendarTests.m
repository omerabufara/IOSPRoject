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
    
    add.txtEventName = (UITextField * ) @"EventName";
    XCTAssertTrue([add.txtEventName isEqual:@"EventName"]);
    XCTAssertFalse([add.txtEventLocation isEqual:@"Event name"]);
    
    add.txtEventDate = (UITextField * ) @"December-20-2015";
    XCTAssertTrue([add.txtEventDate isEqual:@"December-20-2015"]);
    XCTAssertFalse([add.txtEventDate isEqual:@"December/20/2015"]);
    
    add.txtEventTime = (UITextField * ) @"3:00";
    XCTAssertTrue([add.txtEventTime isEqual:@"3:00"]);
    
    add.txtEventLocation = (UITextField * ) @"Here";
    XCTAssertTrue([add.txtEventLocation isEqual:@"Here"]);
    
    add.txtEventDescription = (UITextField * ) @"Consultant";
    XCTAssertTrue([add.txtEventDescription isEqual:@"Consultant"]);
    
//    [hmodel addItems:add.txtEventName.text date:add.txtEventDate.text time:add.txtEventTime.text location:add.txtEventLocation.text description:add.txtEventDescription.text];
//    
//    XCTAssertTrue([hmodel.eventName isEqual:add.txtEventName.text]);
////   hmodel.eventName = @"e v v v v";
//    XCTAssertTrue([hmodel.eventDate isEqual:add.txtEventDate.text]);
//    XCTAssertTrue([hmodel.eventTime isEqual:add.txtEventTime.text]);
//    XCTAssertTrue([hmodel.eventLocation isEqual:add.txtEventLocation.text]);
//    XCTAssertTrue([hmodel.eventDescription isEqual:add.txtEventDescription.text]);
//    hmodel.eventDate = @"December -14-2015";
//    hmodel.eventTime = @"3 :00";
//    hmodel.eventLocation = @"Z 366";
//    hmodel.eventDescription = @"IOS programming";
    
    
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
    XCTAssertTrue([loc.eventId isEqual:@"18"]);
    
    loc.event_name = @"EventName";
    XCTAssertFalse([loc.event_name isEqual:@"Eventname"]);
    
    if ([loc.event_date  isEqual: @"December/20/2015"]) {
        XCTAssertTrue([loc.event_date isEqual:@"December-20-2015"]);
        
    }
    
    else
        
        
        XCTAssertFalse([loc.event_date isEqual:@"December/20/2015"]);
    
    
    
    loc.event_time = @"EventName";
    XCTAssertTrue([loc.event_time isEqual:@"EventName"]);
    
    loc.event_location = @"Z336";
    XCTAssertFalse([loc.event_location isEqual:@"z336"]);
    
    loc.event_description = @"Describe";
    XCTAssertTrue([loc.event_description isEqual:@"Describe"]);
}

-(void)testHomeModelSpaces {
    
    hmodel.eventName = @"e v v v v";
    hmodel.eventDate = @"December -14-2015";
    hmodel.eventTime = @"3 :00";
    hmodel.eventLocation = @"Z 366";
    hmodel.eventDescription = @"IOS programming";
    
    [hmodel addItems:hmodel.eventName date:hmodel.eventDate time:hmodel.eventTime location:hmodel.eventLocation description:hmodel.eventDescription];
   
    XCTAssertFalse([hmodel.eventNamet isEqual:@"e v v v v"]);
    XCTAssertFalse([hmodel.eventDatet isEqual:@"December -14-2015"]);
    XCTAssertFalse([hmodel.eventTimet isEqual:@"3 :00"]);
    XCTAssertFalse([hmodel.eventLoct isEqual:@"Z 366"]);
    XCTAssertFalse([hmodel.eventDesct isEqual:@"IOS programming"]);
    
    XCTAssertTrue([hmodel.eventNamet isEqual:@"evvvv"]);
    XCTAssertTrue([hmodel.eventDatet isEqual:@"December-14-2015"]);
    XCTAssertTrue([hmodel.eventTimet isEqual:@"3:00"]);
    XCTAssertTrue([hmodel.eventLoct isEqual:@"Z366"]);
    XCTAssertTrue([hmodel.eventDesct isEqual:@"IOSprogramming"]);
    

}

-(void)testSignup{
    signUpViewController *signup = [[signUpViewController alloc]init];
    signup.first_name = (UITextField *)@"firstname";
    signup.last_name = (UITextField *)@"lastname";
    signup.email_address = (UITextField *)@"example@mail.com";
    signup.cellPhone = (UITextField *)@"111-222-3333";
    signup.user_name = (UITextField *)@"username";
    signup.password = (UITextField *)@"password";
    
    XCTAssertTrue([signup.first_name isEqual:@"firstname"]);
    XCTAssertTrue([signup.last_name isEqual:@"lastname"]);
    XCTAssertTrue([signup.email_address isEqual:@"example@mail.com"]);
    XCTAssertTrue([signup.cellPhone isEqual:@"111-222-3333"]);
    XCTAssertTrue([signup.user_name isEqual:@"username"]);
    XCTAssertTrue([signup.password isEqual:@"password"]);


}

-(void)testLogin{
    LogInViewController *login = [[LogInViewController alloc]init];
    login.userName = (UITextField *)@"username";
    login.password = (UITextField *)@"password";
    XCTAssertTrue([login.userName isEqual:@"username"]);
    XCTAssertTrue([login.password isEqual:@"password"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
