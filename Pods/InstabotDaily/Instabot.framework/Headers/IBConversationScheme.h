//
//  IBConversationScheme.h
//  ROKOMobi
//
//  Created by Alexey Golovenkov on 06.09.16.
//  Copyright © 2016 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IBScheme.h"

#import "IBConversationIconScheme.h"
#import "IBConversationCloseButtonScheme.h"
#import "IBConversationMessageQuestionScheme.h"
#import "IBConversationUserResponseScheme.h"

@interface IBConversationScheme : IBScheme

@property (nonatomic, strong) IBConversationBackgroundScheme *backgroundScheme;
@property (nonatomic, strong) IBConversationMessageQuestionScheme *messageQuestion;
@property (nonatomic, strong) IBConversationCloseButtonScheme *closeButton;
@property (nonatomic, strong) IBConversationUserResponseScheme *userResponse;
@property (nonatomic, strong) IBConversationIconScheme *chatIcon;

+ (IBConversationScheme *)shared;

@end
