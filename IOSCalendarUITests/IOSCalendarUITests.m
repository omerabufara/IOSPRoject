//
//  IOSCalendarUITests.m
//  IOSCalendarUITests
//
//  Created by Omer Abufara on 11/1/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalendarViewController.h"

@interface IOSCalendarUITests : XCTestCase{
    @private
    CalendarViewController *calendarVC;
}

@end

@implementation IOSCalendarUITests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
   [[[XCUIApplication alloc] init] launch];
    //calendarVC = [[CalendarViewController alloc]init];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

//- (void)testPostMonth{
////    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:0];
////    UITableViewCell *cell = [calendar.calendarTableView cellForRowAtIndexPath:indexPath];
////    UIView *view = [cell.contentView viewWithTag:1];
//    // assert that posted is not hidden
////    XCTAssertTrue(view.hidden == NO);
//}

- (void)testPullDownAdminEvents{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"Admin"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"12345"];
    [logInButton tap];
    [app.buttons[@"Calendar"] tap];
    [app.buttons[@"26"] tap];
    XCTAssertEqual(app.tables.cells.count, 2);
}

-(void)testPullDownUserEvents{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"test"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"pass"];
    [logInButton tap];
    [app.buttons[@"Calendar"] tap];
    [app.buttons[@"26"] tap];
    
    XCTAssertEqual(app.tables.cells.count, 1);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testDetailPopUp{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"Admin"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"12345"];
    [logInButton tap];
    [app.buttons[@"Calendar"] tap];
    [app.buttons[@"25"] tap];
    [app.tables.staticTexts[@"12:00am"] tap];
    XCTAssertTrue(app.staticTexts[@"Christmasdescription"].exists);
    XCTAssertTrue(app.staticTexts[@"12:00am"].exists);
    XCTAssertTrue(app.staticTexts[@"Home"].exists);
    
    //assert that edit event button is visible
    //[app.buttons[@"Edit Event"] tap];
}

- (void)testPostMonth{
     //ADD EVENTS AND CHANGE THE DAY FIRST
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"Admin"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"12345"];
    [logInButton tap];
    [app.buttons[@"Calendar"] tap];
    
    //click on day 1
    XCUIElement *button = app.buttons[@"3"];
    [button tap];
    XCTAssertTrue(!(app.tables.cells.staticTexts[@"Posted"].exists));
    
    //click on day 2
    XCUIElement *button2 = app.buttons[@"4"];
    [button2 tap];
    XCTAssertTrue(!(app.tables.cells.staticTexts[@"Posted"].exists));
    
    //hit post month
    [app.buttons[@"Post Month"] tap];
    
    //click on day 1
    [button tap];
    XCTAssertTrue(app.tables.cells.staticTexts[@"Posted"].exists);
    //click on day 2
    [button2 tap];
    XCTAssertTrue(app.tables.cells.staticTexts[@"Posted"].exists);
}
- (void)testPostDay {
    //ADD EVENT AND CHANGE THE DAY FIRST
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"Admin"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"12345"];
    [logInButton tap];
    [app.buttons[@"Calendar"] tap];
    
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCTAssertTrue(!(app.tables.cells.staticTexts[@"Posted"].exists));
    
    [app.buttons[@"Post Day"] tap];
    [app.buttons[@"30"] tap];
    [button tap];
    
    XCTAssertTrue(app.tables.cells.staticTexts[@"Posted"].exists);
}

@end
