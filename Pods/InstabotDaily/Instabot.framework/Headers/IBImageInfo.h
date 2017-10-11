//
//  ROKOImageDataObject.h
//  ROKOComponents
//
//  Created by Alexey Golovenkov on 21.04.15.
//  Copyright (c) 2015 ROKOLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBDataItem.h"

/**
 *  Stores information about image loaded from Portal
 */
@interface IBImageInfo : IBDataItem

/**
 *  URL of the remote image.
 */
@property (nonatomic, strong) NSString *imageURL;

/**
 *  Downloaded image. It's strongly recommended to avoid using this property in huge amounts of images to minimize memory cost.
 */
@property (nonatomic, strong) UIImage *image;

@end
