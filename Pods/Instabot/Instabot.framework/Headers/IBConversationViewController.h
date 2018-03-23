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

extern NSString  * _Nonnull const kIBConversationDidAppear;
extern NSString  * _Nonnull const kIBConversationDidDisappear;

@interface IBConversationViewController : UIViewController

@property (strong, nonatomic) IBConversationScheme * _Nullable scheme;

+ (instancetype _Nullable)buildControllerWithBot:(IBConversation *_Nonnull)conversation;

- (void)showAsOverlay;

@end
