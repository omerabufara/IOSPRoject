//
//  JenUnitTests.m
//  IOSCalendar
//
//  Created by Jennifer Moran on 12/14/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalendarViewController.h"

@interface JenUnitTests : XCTestCase{
@private
    CalendarViewController *calendar;
}
@end

@implementation JenUnitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    calendar = [[CalendarViewController alloc] init];
//    XCTAssertNotNil(calendar, @"Cannot create Calendar instance");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testLogout{
//    [calendar logoutUser:nil];
//    NSString *usernameStored = [[NSUserDefaults standardUserDefaults]
//                                stringForKey:@"usernameSaved"];
//    XCTAssertTrue([usernameStored isEqualToString:@""]);
//}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
