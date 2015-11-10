//
//  EventManager.m
//  IOSCalendar
//
//  Created by Moran, Jennifer on 11/10/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "EventManager.h"

#import "Event.h"

static NSString *eventsFileName = @"Events.data";

@interface EventManager ()

@property NSMutableArray *eventsToDisplay;
//need this if telling view what to do
//@property (nonatomic, strong) NSOperationQueue *backgroundQueue;
@end

@implementation EventManager

-(id)init{
    self = [super init];
    if (self){
        self.eventsToDisplay = [NSMutableArray array];
        //need to init background queue
        //self.backgroundQueue = [[NSOperationQueue alloc]init];
    }
    return self;
}

+(id)initMovieManager
{
    EventManager *eventManager = [[EventManager alloc]init];
    //need to init background queue
    //movieManager.backgroundQueue = [[NSOperationQueue alloc]init];
    
    if(eventManager) {
        eventManager.eventsToDisplay = [NSMutableArray array];
        //[movieManager loadModelFromFile]; //call moved into the thread (messaging)
    }
    return eventManager;
}

-(void)replaceEvent:(Event *)event atIndex:(NSUInteger)index{
    //checking for if(index) messed up the first index when trying to edit
    if(index < [self.eventsToDisplay count]){
        [self removeEventAtIndex:index];
    }
    [self insertEvent:event atIndex:&index];
}

-(void)insertEvent:(Event *)event atIndex:(NSUInteger *)index{
    //this will allow for duplicate books to be inserted
    BOOL duplicatedEvent = [self.eventsToDisplay containsObject:event];
    if(duplicatedEvent){
        return;
    }
    if(index){
        [self.eventsToDisplay insertObject:event atIndex:*index];
    }
    else{
        [self.eventsToDisplay addObject:event];
    }
    //[self saveModelToFile]; //call moved into the thread (messaging)
}
-(void)removeEventAtIndex:(NSUInteger)index{
    [self.eventsToDisplay removeObjectAtIndex:index];
    //[self saveModelToFile];
}

-(Event*)getEventAtIndex:(NSInteger)index{
    return [self.eventsToDisplay objectAtIndex:index];
}

-(NSUInteger)size{
    return [self.eventsToDisplay count];
}

#pragma mark - managing writing data to/from a file
//need if manager telling view to change
/*-(void) save{
 //this is a block
 [self.backgroundQueue addOperationWithBlock: ^{
 [self saveModelToFile];
 }];
 }
 -(void) loadSampleContent {
 [self.backgroundQueue addOperationWithBlock:^{
 if(self.moviesToDisplay){
 //in the background go tell main queue to do stuff
 [[NSOperationQueue mainQueue] addOperationWithBlock:^{
 [self loadModelFromFile];
 //telling the display to update
 [self.delegate reload];
 }];
 }
 }];
 }*/

-(void)saveModelToFile{
    NSURL *url = [self urlForDataFile];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.eventsToDisplay];
    [data writeToURL:url atomically:YES];
    [NSThread sleepForTimeInterval:2.0];
}

- (void)loadModelFromFile {
    NSURL *url = [self urlForDataFile];
    
    //NSKeyedArchiver is a binary that has searchable XML in it
    NSArray *events = [NSKeyedUnarchiver unarchiveObjectWithFile:[url path]];
    if(events)
    {
        self.eventsToDisplay = [[NSMutableArray alloc] initWithArray:events];
    }
}

-(NSURL *)urlForDataFile{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSArray *directories =
    [manager URLsForDirectory:NSDocumentDirectory
                    inDomains:NSUserDomainMask];
    //here could go after the firstObject, or some index
    NSURL *directory = [directories lastObject];
    
    return [directory URLByAppendingPathComponent:eventsFileName];
}

-(void)initializeManager{
    NSArray *events =
    @[
      [Event eventWithName:@"Event 1" evDate:@"11/11/2015" evtime:@"2:00 pm" evloc:@"Erie, PA" evdescribe:@"Some small event"],
      [Event eventWithName:@"Event 2" evDate:@"11/11/2015" evtime:@"3:00 pm" evloc:@"Erie, PA" evdescribe:@"Another small event"]

      ];
    self.eventsToDisplay = [[NSMutableArray alloc] initWithArray:events];
}




@end
