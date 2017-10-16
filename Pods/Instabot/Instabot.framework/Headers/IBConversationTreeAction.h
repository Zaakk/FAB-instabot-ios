//
//  IBConversationTreeAction.h
//  ROKOMobi
//
//  Created by Alexey Golovenkov on 14.09.16.
//  Copyright © 2016 ROKO Labs. All rights reserved.
//

#import "IBDataItem.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, IBConversationTreeActionType) {
	IBConversationTreeActionTypeTextPrompt,
	IBConversationTreeActionTypeLink,
	IBConversationTreeActionTypeAppPage,
	IBConversationTreeActionTypeShare,
	IBConversationTreeActionTypeClose,
    IBConversationTreeActionTypeReference
};

@class IBConversationTreeNode;
@class ROKOImageDataObject;
@class IBConversationTreeActionSettings;
@class IBFileUploadInfo;

@interface IBConversationTreeAction : IBDataItem

@property (nonatomic, assign) IBConversationTreeActionType type;
@property (nonatomic, assign) IBConversationTreeActionType postActionType;
@property (nonatomic, copy) NSString *buttonText;
@property (nonatomic, strong) IBConversationTreeNode *childNode;
@property (nonatomic, strong) NSDictionary *pageSettings;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSString *cardImageURL;
@property (nonatomic, copy) NSString *cardDescription;
@property (nonatomic, copy) NSArray *multiSelectOptions;
@property (nonatomic, strong) IBConversationTreeActionSettings *settings;
@property (nonatomic, strong) NSNumber *contentItemId;

// not the best way to display attached images, but the fastes
// needs to move this property from action class
@property (nonatomic, strong) UIImage *attachedImage;

@property (nonatomic, strong) NSString *userResponse;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary saveNodesToMap:(NSMutableDictionary<NSNumber *, IBConversationTreeNode *> *)map;

@end
