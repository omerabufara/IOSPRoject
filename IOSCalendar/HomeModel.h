//
//  HomeModel.h
//  IOSCalendar
//
//  Created by Omer Abufara on 11/17/15.
//  Copyright © 2015 Omer Abufara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject  <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems: (NSString*) day monthly:(NSString*)month year:(NSString*)currYear;
- (void)deleteItems: (NSInteger*) recordid;

- (void)addItems: (NSString*) evName date:(NSString*)evDate time:(NSString*)evTime location:(NSString*)evLocation description:(NSString*)evDescription;

- (void)addUsers: (NSString*) fName lName:(NSString*)lName mail:(NSString*)mail cell:(NSString*)phoneNo Uname:(NSString*)Uname psw:(NSString*)psw;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

- (void)postEventsByDay:(NSString *)date;
- (void)postEventsByMonth:(NSString *)evMonth year:(NSString*)evYear;
-(BOOL)checkUser:(NSString*) user_name pass:(NSString*)pass;
@end





