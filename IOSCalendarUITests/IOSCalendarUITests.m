//
//  IOSCalendarUITests.m
//  IOSCalendarUITests
//
//  Created by Omer Abufara on 11/1/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalendarViewController.h"
#import "LogInViewController.h"

@interface IOSCalendarUITests : XCTestCase{
    @private
    CalendarViewController *calendarVC;
    LogInViewController *signIn;
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

-(void)testAdd {
    
    
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
    
    XCUIElement *calendarButton = app.buttons[@"Calendar"];
    [calendarButton tap];
    
    XCUIElement *addButton = app.navigationBars[@"Events"].buttons[@"Add"];
    [addButton tap];
    [addButton tap];
    
    XCUIElement *window = [[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0];
    XCUIElement *element = [[[[[[window childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"event 1 "];
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 typeText:@"December-12-2015"];
    
    XCUIElement *textField3 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:2];
    [textField3 tap];
    [textField3 typeText:@"2:00"];
    
    XCUIElement *textField4 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:3];
    [textField4 tap];
    [textField4 typeText:@"Z oo"];
    
    XCUIElement *textField5 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:4];
    [textField5 tap];
    [textField5 typeText:@"describe"];
    [app.navigationBars[@"Add Event"].buttons[@"Save"] tap];
    [[[[window childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2] childrenMatchingType:XCUIElementTypeOther].element tap];
    [calendarButton tap];
    [app.buttons[@"12"] tap];
    [app.tables.staticTexts[@"2:00"] tap];
    

}

-(void)testEdit{

    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"Admin"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"12345\r"];
    [logInButton tap];
    
    XCUIElement *calendarButton = app.buttons[@"Calendar"];
    [calendarButton tap];
    
    XCUIElement *button = app.buttons[@"12"];
    [button tap];
    // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
    [app.buttons[@"Edit Event"] tap];
    
    XCUIElement *element = [[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2] childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"2"];
    [element tap];
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 tap];
    [textField2 tap];
    [textField2 typeText:@"3:00"];
    
    XCUIElement *textField3 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:2];
    [textField3 tap];
    [textField3 typeText:@"park"];
    
    XCUIElement *textField4 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:3];
    [textField4 tap];
    [textField4 tap];
    [textField4 typeText:@""];
    [textField4 typeText:@"discreption"];
    [app.menuItems[@"discretion"] tap];
    [textField4 typeText:@"escription "];
    [app.buttons[@"Save"] tap];
    [calendarButton tap];
    [button tap];
    // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app


}

-(void)testDelete {
    
    
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
    
    XCUIElement *calendarButton = app.buttons[@"Calendar"];
    [calendarButton tap];
    [[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element tap];
    
    XCUIElement *button = app.buttons[@"14"];
    [button tap];
    [app.tables.staticTexts[@"3:00"] tap];
    [app.buttons[@"Delete Event"] tap];
    [calendarButton tap];
    [app.buttons[@"21"] tap];
    [button tap];
    
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

-(void) testSignIn{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"abc"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"1234"];
    [logInButton tap];
    
    XCTAssertTrue(app.staticTexts[@"You are now signed in"].exists);
}

-(void)testRegister{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *logInButton = app.buttons[@"Log In"];
    [logInButton tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"Abc"];
    
    XCUIElement *passwordTextField = app.textFields[@"Password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"1234"];
    [logInButton tap];
    [app.buttons[@"Calendar"] tap];
    [app.buttons[@"20"] tap];
    [app.tables.staticTexts[@"2pm"] tap];
    [app.buttons[@"Register"] tap];
    
    XCTAssertTrue(app.staticTexts[@"Thank you for registering!"].exists);
    
}


@end
