//
//  IOSCalendarTests.m
//  IOSCalendarTests
//
//  Created by Omer Abufara on 11/1/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "signUpViewController.h"
#import "LogInViewController.h"

@interface IOSCalendarTests : XCTestCase

@end

@implementation IOSCalendarTests

- (void)setUp {
    [super setUp];
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
