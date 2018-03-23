//
//  IBConversationTreeTree.h
//  ROKOMobi
//
//  Created by Alexey Golovenkov on 13.09.16.
//  Copyright © 2016 ROKO Labs. All rights reserved.
//

#import "IBDataItem.h"
#import "IBConversationCustomProperty.h"
#import "IBConversationTreeAction.h"

typedef NS_ENUM(NSInteger, ROKOConversationTreeNodePromptType) {
	ROKOConversationTreeNodePromptTypeUndefined,
	ROKOConversationTreeNodePromptTypeStatement,
	ROKOConversationTreeNodePromptTypeFreeText,
	ROKOConversationTreeNodePromptTypeMultiSelect,
	ROKOConversationTreeNodePromptTypeMultipleChoice,
	ROKOConversationTreeNodePromptTypeRichMediaCard
};

typedef NS_ENUM(NSInteger, ROKOConversationTreeNodeErrorAction) {
	ROKOConversationTreeNodeErrorActionEmpty,
	ROKOConversationTreeNodeErrorActionResend,
	ROKOConversationTreeNodeErrorActionContinue
};

@interface IBConversationTreeNode : IBDataItem <NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) ROKOConversationTreeNodePromptType promptType;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) IBConversationCustomProperty *customProperty;
@property (nonatomic, copy) NSString *validationErrorMessage;
@property (nonatomic, assign) ROKOConversationTreeNodeErrorAction errorAction;
@property (nonatomic, strong) NSArray <IBConversationTreeAction *> *actions;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary saveNodesToMap:(NSMutableDictionary<NSNumber *, IBConversationTreeNode *> *)map;

@end
