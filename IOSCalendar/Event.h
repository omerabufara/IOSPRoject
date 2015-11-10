//
//  Event.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/10/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (weak,nonatomic) NSString *eventName;

@property (weak,nonatomic) NSDate *eventDate;

@property (weak,nonatomic) NSString *eventTime;

@property (weak,nonatomic) NSString *eventLocation;

@property (weak,nonatomic) NSString *eventDescription;


-(id) initWithName:(NSString*)eName evDate:(NSDate*)edate evtime:(NSString*)etime evloc:(NSString*)eloc
            evdescribe:(NSString*)ediscribe;

+(instancetype)eventName:(NSString*)n evDate:(NSDate*)d evtime:(NSString*)t evloc:(NSString*)l
              evdescribe:(NSString*)ds;

@end