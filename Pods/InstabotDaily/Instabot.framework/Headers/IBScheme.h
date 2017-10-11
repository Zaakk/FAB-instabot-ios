//
//  IBScheme.h
//  ROKOComponents
//
//  Created by Alexey Golovenkov on 17.04.15.
//  Copyright (c) 2015 ROKOLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBDataItem.h"
#import "IBUISchemeEnums.h"

extern NSString *const kIBDefaultFontFamily;
extern NSString *const kIBDefaultBackgroundColor;
extern CGFloat const kIBDefaultBackgroundOpacity;
extern CGFloat const kIBDefaultFontSize;
extern NSString *const kIBDefaultFontColor;
extern CGFloat const kIBDefaultUserResponsePadding;
extern CGFloat const kIBDefaultUserResponseBorderRadius;
extern CGFloat const kIBDefaultMessageQuestionWidth;
extern CGFloat const kIBDefaultMessageQuestionPadding;
extern CGFloat const kIBDefaultMessageQuestionBorderRadius;
extern CGFloat const kIBDefaultCloseButtonSize;
extern CGFloat const kIBDefaultChatIconBorderRadius;
extern NSString *const kIBDefaultCloseButtonText;

@interface IBScheme : NSObject <NSCoding>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (void)loadFromDictionary:(NSDictionary *)dictionary;

// Parsing helpers
- (UIColor *)decodeColorFromCoder:(NSCoder *)aDecoder forKey:(NSString *)key;
- (IBDataItem *)dataItemFromDictionary:(NSDictionary *)dictionary withKey:(NSString *)key;
//- (ROKOFontDataObject *)fontDataObjectFromDictionary:(NSDictionary *)dictionary withKey:(NSString *)key;
- (UIColor *)colorFromDictionary:(NSDictionary *)dictionary withKey:(NSString *)key;

- (IBScheme *)mergeSchemeWith:(IBScheme *)second;

@end
