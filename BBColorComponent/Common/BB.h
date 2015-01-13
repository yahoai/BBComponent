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
#pragma mark 색상
typedef NS_ENUM(NSInteger, BBColorType){
    BBColorNormalText=0,
    BBColorTitleText,
    BBColorBackground,
    BBColorButtonBackground,
    BBColorButton,
    BBColorButtonTitle=5,
    BBColorNaviButton,
    BBColorNaviButtonTitle,
    BBColorNaviButtonBackground,
    BBColorNaviBackground,
    BBColorNaviTitle=10,
    BBColorAlertBackground,
    BBColorAlertNormalText,
    BBColorAlertTitleText,
    BBColorAlertView,
    BBColorAlertCancelButton=15,
    BBColorAlertCancelButtonBackground,
    BBColorAlertCancelButtonTItle,
    BBColorAlertOtherButton,
    BBColorAlertOtherButtonBackground,
    BBColorAlertOtherButtonTItle = 20,
    BBColorLineView,
    BBColorButtonHighLight,
    BBColorNaviButtonHighLight,
    BBColorAlertCancelHighLight,
    BBColorAlertOtherHighLight=25,
    BBColorAlertOverlay,
    BBColorTextFieldBackground,
    BBColorTextFieldText,
    BBColorTextViewBackground,
    BBColorTextViewText=30,
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
#define BBCOLOR_NAVI_BUTTON                     @"BBCOLOR_NAVI_BUTTON"
#define BBCOLOR_NAVI_BUTTON_TITLE               @"BBCOLOR_NAVI_BUTTON_TITLE"
#define BBCOLOR_NAVI_BACKGROUND                 @"BBCOLOR_NAVI_BACKGROUND"
#define BBCOLOR_NAVI_TITLE                      @"BBCOLOR_NAVI_TITLE"
#define BBCOLOR_NAVI_BUTTON_BACKGROUND          @"BBCOLOR_NAVI_BUTTON_BACKGROUND"
#define BBCOLOR_ALERT_BACKGROUND                @"BBCOLOR_ALERT_BACKGROUND"
#define BBCOLOR_ALERT_NORMARTEXT                @"BBCOLOR_ALERT_NORMARTEXT"
#define BBCOLOR_ALERT_TITLETEXT                 @"BBCOLOR_ALERT_TITLETEXT"
#define BBCOLOR_ALERT_VIEW                      @"BBCOLOR_ALERT_VIEW"
#define BBCOLOR_ALERT_CANCEL_BACKGROUND         @"BBCOLOR_ALERT_CANCEL_BACKGROUND"
#define BBCOLOR_ALERT_CANCEL_TITLE              @"BBCOLOR_ALERT_CANCEL_TITLE"
#define BBCOLOR_ALERT_OTHER_BACKGROUND          @"BBCOLOR_ALERT_OTHER_BACKGROUND"
#define BBCOLOR_ALERT_OTHER_TITLE               @"BBCOLOR_ALERT_OTHER_TITLE"
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
