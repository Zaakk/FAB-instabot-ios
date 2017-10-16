//
//  IBConversationUserResponseScheme.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 15/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBScheme.h"
#import "IBUISchemeEnums.h"
#import "IBConversationFontScheme.h"
#import "IBConversationBackgroundScheme.h"

@interface IBConversationUserResponseScheme : IBScheme

@property (nullable, nonatomic, strong) NSNumber* padding;
@property (nullable, nonatomic, strong) NSNumber* borderRadius;

@property (nullable, nonatomic, strong) IBConversationBackgroundScheme *background;

@property (nullable, nonatomic, strong) IBConversationFontScheme *font;

@end
