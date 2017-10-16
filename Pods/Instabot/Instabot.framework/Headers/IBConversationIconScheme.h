//
//  IBConversationIconScheme.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 15/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBScheme.h"
#import "IBConversationBackgroundScheme.h"

@interface IBConversationIconScheme : IBScheme

@property (nullable, nonatomic, strong) NSNumber *useIcon;

@property (nullable, nonatomic, strong) NSNumber *borderRadius;

@property (nullable, nonatomic, strong) IBConversationBackgroundScheme *background;

@end
