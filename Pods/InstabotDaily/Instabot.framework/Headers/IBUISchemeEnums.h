//
//  IBUISchemesEnums.h
//  ROKOMobi
//
//  Created by Alexander Zakatnov on 30/08/2017.
//  Copyright © 2017 ROKO Labs. All rights reserved.
//

#ifndef IBUISchemesEnums_h
#define IBUISchemesEnums_h

typedef NS_ENUM(NSInteger, IBBackgroundImageRepeatMode) {
    IBBackgroundImageRepeatModeNotSet = 0,
    IBBackgroundImageRepeatModeNoRepeat,
    IBBackgroundImageRepeatModeRepeat
};

typedef NS_ENUM(NSInteger, IBBackgroundImagePosition) {
    IBBackgroundImagePositionNotSet = 0,
    IBBackgroundImagePositionCenter,
    IBBackgroundImagePositionTop,
    IBBackgroundImagePositionLeft,
    IBBackgroundImagePositionBottom,
    IBBackgroundImagePositionRight
};

typedef NS_ENUM(NSInteger, IBFontStyle) {
    IBFontStyleNotSet = -1,
    IBFontStyleNone = 1 << 0,
    IBFontStyleBold = 1 << 1,
    IBFontStyleItalic = 1 << 2,
    IBFontStyleUnderlined = 1 << 3,
    IBFontStyleStrikethrough = 1 << 4
};


#endif /* IBUISchemesEnums_h */
