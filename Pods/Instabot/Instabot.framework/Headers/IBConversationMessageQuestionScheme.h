//
//  IBConversationMessageQuestionScheme.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 10/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBScheme.h"
#import "IBUISchemeEnums.h"
#import "IBConversationFontScheme.h"
#import "IBConversationBackgroundScheme.h"

@interface IBConversationMessageQuestionScheme : IBScheme

@property (nullable, nonatomic, strong) NSNumber* width;
@property (nullable, nonatomic, strong) NSNumber* padding;
@property (nullable, nonatomic, strong) NSNumber* borderRadius;

@property (nullable, nonatomic, strong) IBConversationBackgroundScheme *background;

@property (nullable, nonatomic, strong) IBConversationFontScheme *font;

@end
