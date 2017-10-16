//
//  ROKOInstaBotBackgroundScheme.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 31/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBScheme.h"
#import "IBUISchemeEnums.h"

@interface IBConversationBackgroundScheme : IBScheme

@property (nullable, nonatomic, strong) NSString*       color;
@property (nullable, nonatomic, strong) NSNumber*       opacity;
@property (nullable, nonatomic, strong) NSString*       image;
@property (nonatomic) IBBackgroundImageRepeatMode     repeat;
@property (nonatomic) IBBackgroundImagePosition    position;

@end
