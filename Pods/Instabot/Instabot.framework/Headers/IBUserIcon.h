//
//  ROKOUserIcon.h
//  ROKOMobi
//
//  Created by Igor Sova on 12/10/2016.
//  Copyright © 2016 ROKO Labs. All rights reserved.
//

#import "IBDataItem.h"

@interface IBUserIcon : IBDataItem

@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong) NSDate *urlExpirationDate;

@end
