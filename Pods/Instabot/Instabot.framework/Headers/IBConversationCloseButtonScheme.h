//
//  IBConversationCloseButtonScheme.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 15/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBScheme.h"
#import "IBUISchemeEnums.h"
#import "IBConversationFontScheme.h"
#import "IBConversationBackgroundScheme.h"

@interface IBConversationCloseButtonScheme : IBScheme

@property (nullable, nonatomic, strong) IBConversationFontScheme *font;
@property (nullable, nonatomic, strong) IBConversationBackgroundScheme *background;

@property (nullable, nonatomic, strong) NSString *text;

@end
