//
//  ROKOUserObject.h
//  ROKOMobi
//
//  Created by Maslov Sergey on 18.08.15.
//  Copyright (c) 2015 ROKO Labs. All rights reserved.
//

#import "IBUserIcon.h"

/**
 *  Stores information about Portal user
 */
@interface IBUser : IBDataItem

/**
 *  Date when user signed up
 */
@property (nonatomic, copy, nullable) NSString *createDate;

/**
 *  User email
 */
@property (nonatomic, copy, nullable) NSString *email;

/**
 *  Date when user log into app at the first time
 */
@property (nonatomic, copy, nullable) NSString *firstLoginTime;

/**
 *  Previous login time
 */
@property (nonatomic, copy, nullable) NSString *lastLoginTime;

/**
 *  Phone number
 */
@property (nonatomic, copy, nullable) NSString *phone;

/**
 *  User avatar image object
 */
@property (nonatomic, strong, nullable) IBUserIcon *photoFile;

/**
 *  Additional properties that was set to user on the portal
 */
@property (nonatomic, strong, nullable) NSDictionary *systemProperties;

/**
 *  Date when user data was updated
 */
@property (nonatomic, copy, nullable) NSString *updateDate;

/**
 *  Login name
 */
@property (nonatomic, copy, nullable) NSString *name;

/**
 * 	Subscripting
 */
- (nullable id)objectForKeyedSubscript:(nonnull NSString *)key;
- (void)setObject:(nonnull id)obj forKeyedSubscript:(nonnull NSString *)key;
@end
