//
//  HomeModel.m
//  IOSCalendar
//
//  Created by Omer Abufara on 11/17/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import "HomeModel.h"
#import "Location.h"
//added this
#import "CalendarViewController.h"

@interface HomeModel()
{
    NSMutableData *_downloadedData;
    //added this
    NSString* currentDate;
    NSString* daily;
    NSString* monthly;
    NSString* yearly;
    
    NSString* eventName;
    NSString* eventDate;
    NSString* eventTime;
    NSString* eventLocation;
    NSString* eventDescription;
    
}
@end

@implementation HomeModel

- (void)downloadItems: (NSString*) day monthly:(NSString*)month year:(NSString*)currYear
{
    
    daily = day;
    monthly = month;
    yearly = currYear;
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://pendragon.gannon.edu/IOSPSSH/data/IOS-database.php"];
    
//    // Create the request
   NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
////    
    // Create the NSURLConnection
   [NSURLConnection connectionWithRequest:urlRequest delegate:self];
  

    

//
//NSURLSession *session = [NSURLSession sharedSession];
//[[session dataTaskWithURL:jsonFileUrl completionHandler:^ (NSData *data, NSURLResponse *response, NSError
//    }]resume];                                                         *error){
}

- (void)addItems: (NSString*) evName date:(NSString*)evDate time:(NSString*)evTime location:(NSString*)evLocation description:(NSString*)evDescription
{
    
    eventName = evName;
    eventDate = evDate;
    eventTime = evTime;
    eventLocation = evLocation;
    eventDescription = evDescription;
    
    NSString *add = [NSString stringWithFormat:@"http://pendragon.gannon.edu/IOSPSSH/data/add.php?event_name=%@&event_date=%@&event_time=%@&event_location=%@&event_description=%@",eventName ,eventDate ,eventTime ,eventLocation ,eventDescription];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:add];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];

}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //CalendarViewController *calController = [[CalendarViewController alloc]init];
    // Create an array to store the locations
    NSMutableArray *_locations = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    
    //added this
    currentDate = monthly;
    currentDate = [[currentDate stringByAppendingString:@"-"] stringByAppendingString:daily];
    currentDate = [[currentDate stringByAppendingString:@"-"] stringByAppendingString:yearly];
    //
    
        
        // Loop through Json objects, create question objects and add them to our questions array
        for (int i = 0; i < jsonArray.count; i++)
        {
            NSDictionary *jsonElement = jsonArray[i];
            if([jsonElement[@"event_date"] isEqualToString:currentDate]){
            
                // Create a new location object and set its props to JsonElement properties
                Location *newLocation = [[Location alloc] init];
                newLocation.event_name = jsonElement[@"event_name"];
                newLocation.event_date = jsonElement[@"event_date"];
                newLocation.event_time = jsonElement[@"event_time"];
                newLocation.event_location = jsonElement[@"event_location"];
                newLocation.event_description = jsonElement[@"event_description"];
        
                // Add this question to the locations array
                [_locations addObject:newLocation];
            }
        }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_locations];
    }
}


@end
