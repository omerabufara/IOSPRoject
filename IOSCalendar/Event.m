//
//  Event.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/10/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "Event.h"
static NSString * const EventNameKey = @"EventNameKey";
static NSString * const EventDateKey = @"EventDateKey";
static NSString * const EventTimeKey = @"EventTimeKey";
static NSString * const EventLocationKey = @"EventLocationKey";
static NSString * const EventDescriptionKey = @"EventDiscriptionKey";
@implementation Event


-(id) initWithName:(NSString*)eName evDate:(NSString*)edate evtime:(NSString*)etime evloc:(NSString*)eloc
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

+(instancetype)eventWithName:(NSString*)n evDate:(NSString*)d evtime:(NSString*)t evloc:(NSString*)l
              evdescribe:(NSString*)ds{


    return [[self alloc] initWithName:n  evDate:d evtime:t evloc:l evdescribe:ds ];
    

}

#pragma mark - NSCoding Methods

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if(self){
        _eventName= [aDecoder decodeObjectForKey:EventNameKey];
        _eventDate= [aDecoder decodeObjectForKey:EventDateKey];
        _eventTime = [aDecoder decodeObjectForKey:EventTimeKey];
        _eventLocation= [aDecoder decodeObjectForKey:EventLocationKey];
        _eventDescription = [aDecoder decodeObjectForKey:EventDescriptionKey];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.eventName forKey:EventNameKey];
    [aCoder encodeObject:self.eventDate forKey:EventDateKey];
    [aCoder encodeObject:self.eventTime forKey:EventTimeKey];
    [aCoder encodeObject:self.eventLocation forKey:EventLocationKey];
    [aCoder encodeObject:self.eventDescription forKey:EventDescriptionKey];
    
}

@end
