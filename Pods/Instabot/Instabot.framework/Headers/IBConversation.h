//
//  ROKOInstaBot.h
//  ROKOMobi
//
//  Created by Alexey Golovenkov on 06.09.16.
//  Copyright © 2016 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBConversationViewController.h"
#import "IBConversationScheme.h"
#import "IBConversationTreeNode.h"
#import "InstabotMain.h"

@class IBConversationTree;

/**
 *  ROKO InstaBot class
 */
@interface IBConversation : NSObject

/**
 *  Id of the current conversation
 */
@property (nonatomic, assign, readonly) NSInteger conversationId;

- (void)loadConversationWithId:(NSInteger)conversationId completionBlock:(nonnull IBLoadConversationCompletionBlock)completionBlock;

@end
