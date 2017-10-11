//
//  ROKOInstaBotViewController.h
//  ROKOMobi
//
//  Created by Alexey Golovenkov on 06.09.16.
//  Copyright © 2016 ROKO Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IBConversation;
@class IBConversationScheme;

@interface IBConversationViewController : UIViewController

@property (strong, nonatomic) IBConversationScheme *scheme;

+ (instancetype)buildControllerWithBot:(IBConversation *)conversation;

- (void)showAsOverlay;

@end
