//
//  Location.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/17/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) NSString *event_name;
@property (nonatomic, strong) NSString *event_date;
@property (nonatomic, strong) NSString *event_time;
@property (nonatomic, strong) NSString *event_location;
@property (nonatomic, strong) NSString *event_description;
@property (nonatomic, strong) NSString *posted;


@end
