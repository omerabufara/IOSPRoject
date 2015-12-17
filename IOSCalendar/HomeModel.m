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
#import "LogInViewController.h"

@interface HomeModel()
{
    NSMutableData *_downloadedData;
    //added this
    NSString* currentDate;
    NSString* daily;
    NSString* monthly;
    NSString* yearly;
    
//    NSString* eventName;
//    NSString* eventDate;
//    NSString* eventTime;
//    NSString* eventLocation;
//    NSString* eventDescription;
    NSString* posted;
    
    NSInteger* rid;
    
    NSString *regId;
    
    NSString* firstName;
    NSString* lastName;
    NSString* email;
    NSString* phone;
    NSString* password;
    NSInteger* editID;
    
    
    NSString* eventNameToEdit;
    NSString* eventDateToEdit;
    NSString* eventTimeToEdit;
    NSString* eventLocationToEdit;
    NSString* eventDescriptionToEdit;
    
}
@end

@implementation HomeModel

@synthesize userFound;
//@synthesize userName;

- (void)downloadItems: (NSString*) day monthly:(NSString*)month year:(NSString*)currYear
{
    
    daily = day;
    monthly = month;
    yearly = currYear;
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost:8888/data/IOS-database.php"];
    
//    // Create the request
   NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
////    
    // Create the NSURLConnection
   [NSURLConnection connectionWithRequest:urlRequest delegate:self];
  
}

- (void)downloadItemsUser:(NSString*) day monthly:(NSString*)month year:(NSString*)currYear{
    daily = day;
    monthly = month;
    yearly = currYear;
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost:8888/data/IOS-database-User.php"];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)downloadItemsToEdit: (NSInteger*) recordID
{
    
    editID = recordID;
    
    // Download the json file
    
    NSString *editData = [NSString stringWithFormat:@"http://localhost:8888/data/IOS-database-edit.php?eventId=%ld",*editID];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:editData];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

-(void)edit: (NSInteger*) recordIDtoEdit name:(NSString*) editevName time:(NSString*)editevTime location:(NSString*)editevLocation description:(NSString*)editevDescription{
    
    editID = recordIDtoEdit;
    eventNameToEdit = editevName;
    eventTimeToEdit = editevTime;
    eventLocationToEdit = editevLocation;
    eventDescriptionToEdit = editevDescription;
    
    NSString *eventNameEdit =  [eventNameToEdit stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *eventTimeEdit = [eventTimeToEdit stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *eventLocEdit  =  [eventLocationToEdit stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *eventDesctEdit = [eventDescriptionToEdit stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //NSString *inStr = [NSString stringWithFormat: @"%ld", (long)editID];
    
    NSString *edit = [NSString stringWithFormat:@"http://localhost:8888/data/edit.php?eventId=%ld&event_name=%@&event_time=%@&event_location=%@&event_description=%@",*editID,eventNameEdit,eventTimeEdit,eventLocEdit,eventDesctEdit];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:edit];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    NSLog(@"edit Finished");
}


- (void)addItems: (NSString*) evName date:(NSString*)evDate time:(NSString*)evTime location:(NSString*)evLocation description:(NSString*)evDescription
{
    
    _eventName = evName;
    _eventDate = evDate;
    _eventTime = evTime;
    _eventLocation = evLocation;
    _eventDescription = evDescription;
    
    _eventNamet =  [_eventName stringByReplacingOccurrencesOfString:@" " withString:@""];
    _eventDatet =  [_eventDate stringByReplacingOccurrencesOfString:@" " withString:@""];
    _eventTimet = [_eventTime stringByReplacingOccurrencesOfString:@" " withString:@""];
    _eventLoct  =  [_eventLocation stringByReplacingOccurrencesOfString:@" " withString:@""];
    _eventDesct = [_eventDescription stringByReplacingOccurrencesOfString:@" " withString:@""];

    
    NSString *add = [NSString stringWithFormat:@"http://localhost:8888/data/add.php?event_name=%@&event_date=%@&event_time=%@&event_location=%@&event_description=%@",_eventNamet ,_eventDatet ,_eventTimet ,_eventLoct ,_eventDesct];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:add];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];

}

//still have to account for duplicates in posting events 
- (void)postEventsByDay:(NSString *)date{
    NSString *post = [NSString stringWithFormat:@"http://localhost:8888/data/postEvents.php?event_date=%@", date];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:post];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)postEventsByMonth:(NSString *)evMonth year:(NSString*)evYear{
    NSString *post = [NSString stringWithFormat:@"http://localhost:8888/data/postEventsMonth.php?event_month=%@&event_year=%@", evMonth, evYear];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:post];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)deleteItems: (NSInteger*)recordid{
    
    rid = recordid;
    
    NSString *delete = [NSString stringWithFormat:@"http://localhost:8888/data/delete.php?eventId=%ld",*rid];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:delete];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

-(void) registration: (NSString*)recdid username: (NSString *)user{
    
    regId = recdid;
    
    NSString *reg = [NSString stringWithFormat:@"http://localhost:8888/data/registration.php?eventId=%@&userName=%@",regId, user];
    
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:reg];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    
    
}

- (void)addUsers: (NSString*) fName lName:(NSString*)lName mail:(NSString*)mail cell:(NSString*)phoneNo Uname:(NSString*)Uname psw:(NSString*)psw
{
    
    firstName = fName;
    lastName = lName;
    email = mail;
    phone = phoneNo;
    self.userName = Uname;
    password = psw;
    
    _userfname =  [firstName stringByReplacingOccurrencesOfString:@" " withString:@""];
    _uderlname =  [lastName stringByReplacingOccurrencesOfString:@" " withString:@""];
    _useremail = [email stringByReplacingOccurrencesOfString:@" " withString:@""];
    _userphone  =  [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    _useruname = [self.userName stringByReplacingOccurrencesOfString:@" " withString:@""];
    _userpassword = [password stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *addUser = [NSString stringWithFormat:@"http://localhost:8888/data/add-users.php?firstname=%@&lastname=%@&mail=%@&cell=%@&usernme=%@&paassword=%@",_userfname ,_uderlname ,_useremail ,_userphone ,_useruname ,_userpassword];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:addUser];
    
    //    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    ////
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

- (void)checkUser:(NSString*) user_name pass:(NSString*)pass{
    
    
    self.userName = user_name;
    password = pass;
    //self.senderbutton = sender;
    
    
    NSString *check = [NSString stringWithFormat:@"http://localhost:8888/data/signInCheck.php?userName=%@&password=%@",self.userName,password];
    
    NSURL *jsonFileUrl = [ NSURL URLWithString:check];
    
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
    //if the downloadedData contains more than one object treat as array
    //if only one, treat as variable
    NSError *error;
    if(_downloadedData.length > 1){
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
                newLocation.eventId = jsonElement[@"ID"];
                newLocation.event_name = jsonElement[@"event_name"];
                newLocation.event_date = jsonElement[@"event_date"];
                newLocation.event_time = jsonElement[@"event_time"];
                newLocation.event_location = jsonElement[@"event_location"];
                newLocation.event_description = jsonElement[@"event_description"];
                newLocation.posted = jsonElement[@"posted"];
                
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
    else{
        userFound = [[NSString alloc]initWithData:_downloadedData encoding:NSUTF8StringEncoding];
        LogInViewController *logIn = [[LogInViewController alloc]init];
        logIn.delegate = self.delegateVC;
        [logIn loginFunctionality:userFound username:self.userName];
        
    }

}


@end
