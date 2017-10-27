//
//  InstabotMain.h
//  Instabot
//
//  Created by Alex Golovenkov on 03/09/2017.
//  Copyright © 2017 Instabot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IBAccount;

@class IBUser;
@class IBConversationViewController;

typedef void (^IBLoadConversationCompletionBlock)(IBConversationViewController * _Nullable controller, NSError * _Nullable error);

extern NSString * _Nonnull const kIBShowApplicationPageNotification;

/**
 The entry point of Instabot framework
 */
@interface Instabot : NSObject

+ (nonnull instancetype)shared;

/**
 Initializes Instabot framework
 */
+ (void)start;

/**
 Returns current version of Instabot framework
 
 @return Current framework version
 */
+ (nonnull NSString *)version;

/**
 *  API key of the application to work with. Default value loads from InstabotAPIToken value of application's info.plist file
 */
- (nonnull NSString *)APIKey;

/**
 Service URL
 */
- (nonnull NSString *)APIURL;


/**
 Allows to switch to another application to another application from code

 @param key API Key of your application
 @param url Use nil in most cases
 */
- (void)setAPIKey:(nonnull NSString *)key forURL:(nullable NSString *)url;


/**
 Account management
 */
- (nonnull IBAccount *)account;

/**
 Loads conversation with specified identifyer and returns view controller to be presented

 @param conversationId Identifyer of necessary conversation
 @param completionBlock Completion block to be called on loading is completed
 */
- (void)loadConversationWithId:(NSInteger)conversationId completionBlock:(nonnull IBLoadConversationCompletionBlock)completionBlock;

@end
