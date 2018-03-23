//
//  IBPush.h
//  Instabot
//
//  Created by Alexander Zakatnov on 13/11/2017.
//  Copyright © 2017 Instabot. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^IBHTTPClientCompletion)(id responseObject, NSError *error);

/**
 *  Manages push notifications
 */
@interface IBPush : NSObject

/**
 *  Current APNS token
 */
@property (nonatomic, strong, readonly) NSString *apnsToken;

/**
 *  Registers device token on ROKO Portal
 *
 *  @param apnToken Token from application:didRegisterForRemoteNotificationsWithDeviceToken: method of UIApplicationDelegate object
 *  @param completion Block to be call when response is received (or error occurred)
 */
- (void)registerWithAPNToken:(NSString *)apnToken withCompletion:(IBHTTPClientCompletion)completion;

/**
 *  Default handler for push notification
 *
 *  @param notification Notification that comes to application:didReceiveRemoteNotification: method of UIApplicationDelegate object
 */
- (void)handleNotification:(NSDictionary *)notification;

@end
