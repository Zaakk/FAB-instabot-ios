//
//  ROKOPortalManager.h
//  ROKODoodles
//
//  Created by Maslov Sergey on 03.08.15.
//  Copyright (c) 2015 ROKOLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IBUser;
@class IBAccount;
@class IBPortalInfo;
@class IBSessionInfo;

typedef void(^IBAccountRequestCompletionBlock)(NSError * __nullable error);
typedef void(^IBPortalInfoRequestCompletionBlock)(IBPortalInfo * __nullable info, NSError *__nullable error);
typedef void(^IBSessionInfoRequestCompletionBlock)(IBSessionInfo * __nullable info, NSError *__nullable error);

#import "IBUser.h"
#import "IBPortalInfo.h"
#import "IBSessionInfo.h"

extern NSString * _Nonnull const kInstabotDidChangeUserNotification;

/**
 *  Provides API for login/logout/signup to Instabot Portal.
 */
@interface IBAccount : NSObject

/**
 *  Checks if user is logged in
 */
@property (nonatomic, readonly) BOOL isLogin;

/**
 *  Information about user. Contains nil if user is not logged in
 */
@property (nullable, nonatomic, strong) IBUser *user;

/**
 *  Attempts to login with specified credentials
 *
 *  @param name            user name
 *  @param password        user password
 *  @param completionBlock Completion block. Called both for successful and error result.
 */
- (void)loginWithUser:(nonnull NSString *)name andPassword:(nonnull NSString *)password completionBlock:(nullable IBAccountRequestCompletionBlock)completionBlock;

/**
 *  Attempts to login as a referral user
 *
 *  @param userName        User name
 *  @param completionBlock Completion block. Called both for successful and error result.
 */
- (void)setUserWithName:(nonnull NSString *)userName completionBlock:(nullable IBAccountRequestCompletionBlock)completionBlock;

/**
 *  Logs out from portal
 *
 *  @param completionBlock Calls on response received
 */
- (void)logoutWithCompletionBlock:(nullable IBAccountRequestCompletionBlock)completionBlock;

/**
 *  Registers new portal user
 *
 *  @param name            User name
 *  @param email           User e-mail address
 *  @param password        User password
 *  @param completionBlock Completion block. Called when server response is received. Contains error description in case of fail
 */
- (void)signupUser:(nonnull NSString *)name email:(nonnull NSString *)email andPassword:(nonnull NSString *)password completionBlock:(nullable IBAccountRequestCompletionBlock)completionBlock;

/**
 *  Loads information about portal application
 *
 *  @param completionBlock Completion block. Called when server response is received. Contains ROKOPortalInfo object or error in case of fail
 */
- (void)getPortalInfoWithCompletionBlock:(nonnull IBPortalInfoRequestCompletionBlock)completionBlock;

/**
 *  Loads information about current user session
 *
 *  @param completionBlock Completion block. Called when server response is received. Contains ROKOSessionInfo object or error in case of fail
 */
- (void)getSessionInfoWithCompletionBlock:(nonnull IBSessionInfoRequestCompletionBlock)completionBlock;

/**
 Sets new custom property for the current user
 
 @param newValue New parameter value
 @param name  Name of parameter to be changed
 @param block Completion block to be called when request is finished
 */
- (void)setUserCustomProperty:(nullable id)newValue forKey:(nonnull NSString *)name completionBlock:(nullable IBAccountRequestCompletionBlock)block;

@end
