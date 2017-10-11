//
//  ROKOInstaBotFontScheme.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 31/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBScheme.h"
#import "IBUISchemeEnums.h"

@interface IBConversationFontScheme : IBScheme

@property (nullable, nonatomic, strong) NSString*   family;
@property (nullable, nonatomic, strong) NSString*   color;
@property (nullable, nonatomic, strong) NSNumber*   size;
@property (assign, nonatomic) IBFontStyle         style;

@end
