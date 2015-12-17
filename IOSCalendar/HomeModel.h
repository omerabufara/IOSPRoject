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

//NSInteger eventFoundInt;

@interface HomeModel : NSObject  <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;
@property (nonatomic,retain) id delegateVC;
@property NSString *userFound;
@property NSString *userName;

- (void)downloadItems: (NSString*) day monthly:(NSString*)month year:(NSString*)currYear;
- (void)downloadItemsUser:(NSString*) day monthly:(NSString*)month year:(NSString*)currYear;
- (void)deleteItems: (NSInteger*) recordid;

- (void)addItems: (NSString*) evName date:(NSString*)evDate time:(NSString*)evTime location:(NSString*)evLocation description:(NSString*)evDescription;

- (void)addUsers: (NSString*) fName lName:(NSString*)lName mail:(NSString*)mail cell:(NSString*)phoneNo Uname:(NSString*)Uname psw:(NSString*)psw;
-(void)edit:(NSInteger*) recordIDtoEdit name:(NSString*) editevName time:(NSString*)editevTime location:(NSString*)editevLocation description:(NSString*)editevDescription;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
-(void) registration: (NSString*)recdid username: (NSString *)user;

- (void)postEventsByDay:(NSString *)date;
- (void)postEventsByMonth:(NSString *)evMonth year:(NSString*)evYear;
- (void)checkUser:(NSString*) user_name pass:(NSString*)pass;
@end





