//
//  BB.h
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark -
#pragma mark 기초

#define NSLog( s, ... ) NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#pragma mark -
#pragma mark 색상조합
typedef NS_ENUM(NSInteger, BBColorCombination) {
    DEFAULT_GREEN=1,
    DEFAULT_BLACK_WHITE,
    DEFAULT_RED,
};

#pragma mark -
#pragma mark 색상

typedef NS_ENUM(NSInteger, BBColorType){
    BBColorNormalText=0,
    BBColorTitleText,
    BBColorBackground,
    BBColorButtonBackground,
    BBColorButton,
    BBColorButtonTitle,
    BBColorButtonBorder,
    BBColorNaviButton,
    BBColorNaviButtonTitle,
    BBColorNaviButtonBackground,
    BBColorNaviButtonBorder,
    BBColorNaviBackground,
    BBColorNaviTitle,
    BBColorNaviBottomLine,
    BBColorAlertBackground,
    BBColorAlertNormalText,
    BBColorAlertTitleText,
    BBColorAlertView,
    BBColorAlertCancelButton,
    BBColorAlertCancelButtonBorder,
    BBColorAlertCancelButtonBackground,
    BBColorAlertCancelButtonTItle,
    BBColorAlertOtherButton,
    BBColorAlertOtherButtonBorder,
    BBColorAlertOtherButtonBackground,
    BBColorAlertOtherButtonTItle,
    BBColorAlertBackgroundBorder,
    BBColorLineView,
    BBColorButtonHighLight,
    BBColorNaviButtonHighLight,
    BBColorAlertCancelHighLight,
    BBColorAlertOtherHighLight,
    BBColorAlertOverlay,
    BBColorTextFieldBackground,
    BBColorTextFieldText,
    BBColorTextViewBackground,
    BBColorTextViewText,
    BBColorTextFieldBorder,
    BBColorTextViewBorder,
    BBColorTextField,
    BBColorTextView,


};


#define BBCOLOR_BACKGROUND                      @"BBCOLOR_BACKGROUND"
#define BBCOLOR_TITLETEXT                       @"BBCOLOR_TITLETEXT"
#define BBCOLOR_NORMALTEXT                      @"BBCOLOR_NORMALTEXT"
#define BBCOLOR_BUTTON                          @"BBCOLOR_BUTTON"
#define BBCOLOR_BUTTON_TITLE                    @"BBCOLOR_BUTTON_TITLE"
#define BBCOLOR_BUTTON_BACKGROUND               @"BBCOLOR_BUTTON_BACKGROUND"
#define BBCOLOR_BUTTON_BORDER                   @"BBCOLOR_BUTTON_BORDER"
#define BBCOLOR_NAVI_BUTTON                     @"BBCOLOR_NAVI_BUTTON"
#define BBCOLOR_NAVI_BUTTON_TITLE               @"BBCOLOR_NAVI_BUTTON_TITLE"
#define BBCOLOR_NAVI_BACKGROUND                 @"BBCOLOR_NAVI_BACKGROUND"
#define BBCOLOR_NAVI_TITLE                      @"BBCOLOR_NAVI_TITLE"
#define BBCOLOR_NAVI_BUTTON_BACKGROUND          @"BBCOLOR_NAVI_BUTTON_BACKGROUND"
#define BBCOLOR_NAVI_BUTTON_BORDER              @"BBCOLOR_NAVI_BUTTON_BORDER"
#define BBCOLOR_NAVI_BOTTOM_LINE                @"BBCOLOR_NAVI_BOTTOM_LINE"
#define BBCOLOR_ALERT_BACKGROUND                @"BBCOLOR_ALERT_BACKGROUND"
#define BBCOLOR_ALERT_BACKGROUND_BORDER         @"BBCOLOR_ALERT_BACKGROUND_BORDER"
#define BBCOLOR_ALERT_NORMARTEXT                @"BBCOLOR_ALERT_NORMARTEXT"
#define BBCOLOR_ALERT_TITLETEXT                 @"BBCOLOR_ALERT_TITLETEXT"
#define BBCOLOR_ALERT_VIEW                      @"BBCOLOR_ALERT_VIEW"
#define BBCOLOR_ALERT_CANCEL_BACKGROUND         @"BBCOLOR_ALERT_CANCEL_BACKGROUND"
#define BBCOLOR_ALERT_CANCEL_BORDER             @"BBCOLOR_ALERT_CANCEL_BORDER"
#define BBCOLOR_ALERT_CANCEL_TITLE              @"BBCOLOR_ALERT_CANCEL_TITLE"
#define BBCOLOR_ALERT_OTHER_BACKGROUND          @"BBCOLOR_ALERT_OTHER_BACKGROUND"
#define BBCOLOR_ALERT_OTHER_TITLE               @"BBCOLOR_ALERT_OTHER_TITLE"
#define BBCOLOR_ALERT_OTHER_BORDER              @"BBCOLOR_ALERT_OTHER_BORDER"
#define BBCOLOR_LINE_VIEW                       @"BBCOLOR_LINE_VIEW"
#define BBCOLOR_ALERT_OVERLAY                   @"BBCOLOR_ALERT_OVERLAY"
#define BBCOLOR_TEXTVIEW_BACKGROND              @"BBCOLOR_TEXTVIEW_BACKGROND"
#define BBCOLOR_TEXTVIEW_TEXT                   @"BBCOLOR_TEXTVIEW_TEXT"
#define BBCOLOR_TEXTVIEW_BORDER                 @"BBCOLOR_TEXTVIEW_BORDER"
#define BBCOLOR_TEXTFIELD_BACKGROUND            @"BBCOLOR_TEXTFIELD_BACKGROUND"
#define BBCOLOR_TEXTFIELD_TEXT                  @"BBCOLOR_TEXTFIELD_TEXT"
#define BBCOLOR_TEXTFIELD_BORDER                @"BBCOLOR_TEXTFIELD_BORDER"


#define COLOR_KEY                   @"COLOR_KEY"
#define COLOR_KEY_TIME              @"COLOR_KEY_TIME"


#define COLOR_CLEAR             [UIColor clearColor]
#define COLOR_000000			[UIColor colorWithRed:          0 green:          0 blue:          0 alpha:1.0]
#define COLOR_FFFFFF			[UIColor colorWithRed:        1.0 green:        1.0 blue:        1.0 alpha:1.0]


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#pragma mark -
#pragma mark 폰트

#define DEFAULT_FONT_20         [UIFont systemFontOfSize:20]
#define DEFAULT_FONT_17         [UIFont systemFontOfSize:17]
#define DEFAULT_FONT_15         [UIFont systemFontOfSize:15]
#define DEFAULT_FONT_12         [UIFont systemFontOfSize:12]
#define DEFAULT_FONT_10         [UIFont systemFontOfSize:10]


#define DEFAULT_FONT_20_BOLD         [UIFont boldSystemFontOfSize:20]


#import "BBComponent.h"
#import "BBColor.h"
#import "BBControl.h"
