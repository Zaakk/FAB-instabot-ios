//
//  ROKOLogger.h
//  ROKOComponents
//
//  Created by Alexey Golovenkov on 16.03.15.
//  Copyright (c) 2015 ROKOLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Allows developer to send analytic events
 */
@interface IBAnalytics : NSObject

/**
 Sends analytic event to ROKO Analytics. Stores message in local db if server is not avaliable

 @param eventTitle      Event name
 @param eventParameters Optional parameters for the event.
 */
+ (void)addEvent:(nonnull NSString *)eventTitle withParameters:(nullable NSDictionary *)eventParameters;

/**
  Sends analytic event to ROKO Analytics. Stores message in local db if server is not avaliable

  @param eventTitle      Event name
 */
+ (void)addEvent:(nonnull NSString *)eventTitle;

@end
