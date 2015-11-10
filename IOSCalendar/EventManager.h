//
//  EventManager.h
//  IOSCalendar
//
//  Created by Moran, Jennifer on 11/10/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventManager : NSObject

+(id)initEventManager;
-(id) init;

-(Event*)getMovieAtIndex: (NSInteger) index;
-(void)removeEventAtIndex: (NSUInteger) index;
-(void)replaceEvent: (Event *)event atIndex: (NSUInteger) index;
-(void)insertEvent: (Event *)event atIndex: (NSUInteger*) index;

//need these public if view controller telling manager what to do
-(void)loadModelFromFile;
-(void) saveModelToFile;
//-(void)putMovieAtIndex: (NSInteger) index;

-(NSInteger)size;

@end
