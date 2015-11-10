//
//  Event.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/10/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject <NSCoding>

@property (weak,nonatomic) NSString *eventName;

@property (weak,nonatomic) NSString *eventDate;

@property (weak,nonatomic) NSString *eventTime;

@property (weak,nonatomic) NSString *eventLocation;

@property (weak,nonatomic) NSString *eventDescription;


-(id) initWithName:(NSString*)eName evDate:(NSString*)edate evtime:(NSString*)etime evloc:(NSString*)eloc
            evdescribe:(NSString*)ediscribe;

+(instancetype)eventWithName:(NSString*)n evDate:(NSString*)d evtime:(NSString*)t evloc:(NSString*)l
              evdescribe:(NSString*)ds;

@end