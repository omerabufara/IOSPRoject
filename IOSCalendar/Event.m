//
//  Event.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/10/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "Event.h"

@implementation Event


-(id) initWithName:(NSString*)eName evDate:(NSDate*)edate evtime:(NSString*)etime evloc:(NSString*)eloc
        evdescribe:(NSString*)ediscribe{

    self = [super init];
    if(self) {
        _eventName = eName;
        _eventDate = edate;
        _eventTime = etime;
        _eventLocation = eloc;
        _eventDescription = ediscribe;
    }
    return self;

    

}

+(instancetype)eventName:(NSString*)n evDate:(NSDate*)d evtime:(NSString*)t evloc:(NSString*)l
              evdescribe:(NSString*)ds{


    return [[self alloc] initWithName:n  evDate:d evtime:t evloc:l evdescribe:ds ];
    

}

@end
