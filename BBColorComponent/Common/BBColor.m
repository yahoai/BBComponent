//
//  BBColor.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "BBColor.h"

@implementation BBColor

+ (id)getUserDefault:(NSString *)key{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs objectForKey:key];
}

+ (void)setUserDefault:(NSString *)key value:(NSString *)value{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:value forKey:key];
    [prefs synchronize];
}

+ (float)getColorKey{
    return [[self getUserDefault:COLOR_KEY] floatValue];
}

+ (void)setColorKey{
    float key = [[self getUserDefault:COLOR_KEY] floatValue];
    if(key == 3)
        key = 0;
    
    key++;
    
    //키 변경 시간
    NSDate *changeKeyTime = [NSDate date];
    
    [self setUserDefault:COLOR_KEY value:[NSString stringWithFormat:@"%f",key]];
    [self setUserDefault:COLOR_KEY_TIME value:[NSString stringWithFormat:@"%@",changeKeyTime]];
    [self setColor:key];
//    NSLog(@"%f",key);
}

+ (UIColor *)getColor:(BBColorType)type {
    NSData *data;
//    NSLog(@"%d",type);
    switch (type) {
        case BBColorBackground:
            data = [self getUserDefault:BBCOLOR_BACKGROUND];
            break;
        case BBColorButtonTitle:
            data = [self getUserDefault:BBCOLOR_BUTTON_TITLE];
            break;
        case BBColorButtonBackground:
            data = [self getUserDefault:BBCOLOR_BUTTON_BACKGROUND];
            break;
        case BBColorNaviBackground:
            data = [self getUserDefault:BBCOLOR_NAVI_BACKGROUND];
            break;
        case BBColorNaviButtonTitle:
            data = [self getUserDefault:BBCOLOR_NAVI_BUTTON_TITLE];
            break;
        case BBColorNaviButtonBackground:
            data = [self getUserDefault:BBCOLOR_NAVI_BUTTON_BACKGROUND];
            break;
        case BBColorNaviTitle:
            data = [self getUserDefault:BBCOLOR_NAVI_TITLE];
            break;
        case BBColorNormalText:
            data = [self getUserDefault:BBCOLOR_NORMALTEXT];
            break;
        case BBColorTitleText:
            data = [self getUserDefault:BBCOLOR_TITLETEXT];
            break;
        case BBColorAlertBackground:
            data = [self getUserDefault:BBCOLOR_ALERT_BACKGROUND];
            break;
        case BBColorAlertNormalText:
            data = [self getUserDefault:BBCOLOR_ALERT_NORMARTEXT];
            break;
        case BBColorAlertTitleText:
            data = [self getUserDefault:BBCOLOR_ALERT_TITLETEXT];
            break;
        case BBColorAlertCancelButtonBackground:
            data = [self getUserDefault:BBCOLOR_ALERT_CANCEL_BACKGROUND];
            break;
        case BBColorAlertCancelButtonTItle:
            data = [self getUserDefault:BBCOLOR_ALERT_CANCEL_TITLE];
            break;
        case BBColorAlertOtherButtonBackground:
            data = [self getUserDefault:BBCOLOR_ALERT_OTHER_BACKGROUND];
            break;
        case BBColorAlertOtherButtonTItle:
            data = [self getUserDefault:BBCOLOR_ALERT_OTHER_TITLE];
            break;
        case BBColorLineView:
            data = [self getUserDefault:BBCOLOR_LINE_VIEW];
            break;
        case BBColorTextFieldBackground:
            data = [self getUserDefault:BBCOLOR_TEXTFIELD_BACKGROUND];
            break;
        case BBColorTextFieldBorder:
            data = [self getUserDefault:BBCOLOR_TEXTFIELD_BORDER];
            break;
        case BBColorTextFieldText:
            data = [self getUserDefault:BBCOLOR_TEXTFIELD_TEXT];
            break;
        case BBColorTextViewBackground:
            data = [self getUserDefault:BBCOLOR_TEXTVIEW_BACKGROND];
            break;
        case BBColorTextViewBorder:
            data = [self getUserDefault:BBCOLOR_TEXTVIEW_BORDER];
            break;
        case BBColorTextViewText:
            data = [self getUserDefault:BBCOLOR_TEXTVIEW_TEXT];
            break;
            
            
        default:
            break;
    }
    
//    NSLog(@"type : %d data: %@",type,data?@"data":@"null");
    UIColor *color;
    if(data != nil)
        color = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
//    if(BBColorTextFieldBackground == type)
//        NSLog(@"%d: %@",type,color);

    return color;
}

+ (NSDictionary *)getColorCombination:(float)key{
    NSDictionary *combination = [[NSDictionary alloc]init];
    
    UIColor *backGroundColor,*buttonTitleColor,*buttonBackgroundColor,*naviBackgroundColor,*naviButtonTitleColor,*naviButtonBackgroundColor,*naviTitleColor,*normalTextColor,*titleColor,*alertBackgroundColor,*alertNormalText,*alertTitleText,*alertCacncelBackgroundColor,*alertCancelTitleColor,*alertOtherBackgroundColor,*alertOtherTitleColor,*lineViewColor,*textFieldBackgroundColor,*textFieldBorderColor,*textFieldTextColor,*textViewBackgroundColor,*textViewBorderColor,*textViewTextColor;
    
    NSData *backGroundColorData,*buttonTitleColorData,*buttonBackgroundColorData,*naviBackgroundColorData,*naviButtonTitleColorData,*naviButtonBackgroundColorData,*naviTitleColorData,*normalTextColorData,*titleColorData,*alertBackgroundColorData,*alertNormalTextData,*alertTitleTextData,*alertCancelBackgroundColorData,*alertCancelTitleColorData,*alertOtherBackgroundColorData,*alertOtherTitleColorData,*lineViewColorData,*textFieldBackgroundColorData,*textFieldBorderColorData,*textFieldTextColorData,*textViewBackgroundColorData,*textViewBorderColorData,*textViewTextColorData;
    
    if(key == 1){
        backGroundColor = UIColorFromRGB(0xffffff);
        buttonBackgroundColor = UIColorFromRGB(0x33B2E3);
        buttonTitleColor = UIColorFromRGB(0xffffff);
        naviBackgroundColor = UIColorFromRGB(0x33B2E3);
        naviButtonBackgroundColor = COLOR_CLEAR;
        naviButtonTitleColor = COLOR_FFFFFF;
        naviTitleColor = COLOR_FFFFFF;
        normalTextColor = UIColorFromRGB(0xcccccc);
        titleColor = UIColorFromRGB(0x33B2E3);
        alertBackgroundColor = UIColorFromRGB(0xf5f5f5);
        alertNormalText = UIColorFromRGB(0x000000);
        alertCacncelBackgroundColor = UIColorFromRGB(0x33B2E3);
        alertCancelTitleColor = COLOR_FFFFFF;
        alertOtherBackgroundColor = UIColorFromRGB(0x33B2E3);
        alertOtherTitleColor = COLOR_FFFFFF;
        lineViewColor = UIColorFromRGB(0x33B2E3);
        textFieldBackgroundColor = UIColorFromRGB(0xf5f5f5);
        textFieldBorderColor = UIColorFromRGB(0xdedede);
        textFieldTextColor = UIColorFromRGB(0x666666);
        textViewBackgroundColor = UIColorFromRGB(0xf5f5f5);
        textViewBorderColor = UIColorFromRGB(0xdedede);
        textViewTextColor = UIColorFromRGB(0x666666);
    }
    
    if(key == 2){
        backGroundColor = UIColorFromRGB(0xffffff);
        buttonBackgroundColor = UIColorFromRGB(0xD33C3A);
        buttonTitleColor = UIColorFromRGB(0xffffff);
        naviBackgroundColor = UIColorFromRGB(0xD33C3A);
        naviButtonBackgroundColor = COLOR_CLEAR;
        naviButtonTitleColor = COLOR_FFFFFF;
        naviTitleColor = COLOR_FFFFFF;
        normalTextColor = UIColorFromRGB(0xcccccc);
        titleColor = UIColorFromRGB(0xF25950);
        alertBackgroundColor = UIColorFromRGB(0xFAC1BF);
        alertNormalText = UIColorFromRGB(0xffffff);
        alertTitleText = UIColorFromRGB(0xD33C3A);
        alertCacncelBackgroundColor = UIColorFromRGB(0x33B2E3);
        alertCancelTitleColor = COLOR_FFFFFF;
        alertOtherBackgroundColor = UIColorFromRGB(0xFF5A5F);
        alertOtherTitleColor = COLOR_FFFFFF;
        lineViewColor = UIColorFromRGB(0xD33C3A);
        textFieldBackgroundColor = UIColorFromRGB(0xFAC1BF);
        textFieldBorderColor = UIColorFromRGB(0xFAC1BF);
        textFieldTextColor = UIColorFromRGB(0xffffff);
        textViewBackgroundColor = UIColorFromRGB(0xFAC1BF);
        textViewBorderColor = UIColorFromRGB(0xFAC1BF);
        textViewTextColor = UIColorFromRGB(0xffffff);
    }
    
    if(key == 3){
        backGroundColor = UIColorFromRGB(0x72B93C);
        buttonBackgroundColor = COLOR_FFFFFF;
        buttonTitleColor = UIColorFromRGB(0x72B93C);
        naviBackgroundColor = COLOR_FFFFFF;
        naviButtonBackgroundColor = COLOR_CLEAR;
        naviButtonTitleColor = UIColorFromRGB(0x72B93C);
        naviTitleColor = UIColorFromRGB(0x72B93C);
        normalTextColor = UIColorFromRGB(0xd5f0c0);
        titleColor = UIColorFromRGB(0xffffff);
        alertBackgroundColor = UIColorFromRGB(0xffffff);
        alertNormalText = UIColorFromRGB(0x91C767);
        alertTitleText = UIColorFromRGB(0x72B93C);
        alertCacncelBackgroundColor = UIColorFromRGB(0x33B2E3);
        alertCancelTitleColor = COLOR_FFFFFF;
        alertOtherBackgroundColor = UIColorFromRGB(0xFF5A5F);
        alertOtherTitleColor = COLOR_FFFFFF;
        lineViewColor = UIColorFromRGB(0xd5f0c0);
        textFieldBackgroundColor = UIColorFromRGB(0xffffff);
        textFieldBorderColor = UIColorFromRGB(0xffffff);
        textFieldTextColor = UIColorFromRGB(0x91C767);
        textViewBackgroundColor = UIColorFromRGB(0xffffff);
        textViewBorderColor = UIColorFromRGB(0xffffff);
        textViewTextColor = UIColorFromRGB(0x91C767);
    }
    
    
    backGroundColorData = [NSKeyedArchiver archivedDataWithRootObject:backGroundColor];
    buttonBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:buttonBackgroundColor];
    buttonTitleColorData = [NSKeyedArchiver archivedDataWithRootObject:buttonTitleColor];
    naviBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:naviBackgroundColor];
    naviButtonBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:naviButtonBackgroundColor];
    naviButtonTitleColorData = [NSKeyedArchiver archivedDataWithRootObject:naviButtonTitleColor];
    naviTitleColorData = [NSKeyedArchiver archivedDataWithRootObject:naviTitleColor];
    
    normalTextColorData = [NSKeyedArchiver archivedDataWithRootObject:normalTextColor];
    titleColorData   = [NSKeyedArchiver archivedDataWithRootObject:titleColor];
    
    alertBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:alertBackgroundColor];
    alertNormalTextData = [NSKeyedArchiver archivedDataWithRootObject:alertNormalText];
    alertTitleTextData = [NSKeyedArchiver archivedDataWithRootObject:alertTitleText];
    
    alertOtherBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:alertOtherBackgroundColor];
    alertOtherTitleColorData =[NSKeyedArchiver archivedDataWithRootObject:alertOtherTitleColor];
    alertCancelBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:alertCacncelBackgroundColor];
    alertCancelTitleColorData = [NSKeyedArchiver archivedDataWithRootObject:alertCancelTitleColor];
    
    lineViewColorData = [NSKeyedArchiver archivedDataWithRootObject:lineViewColor];
    
    textFieldBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:textFieldBackgroundColor];
    textFieldBorderColorData = [NSKeyedArchiver archivedDataWithRootObject:textFieldBorderColor];
    textFieldTextColorData = [NSKeyedArchiver archivedDataWithRootObject:textFieldTextColor];
    
    textViewBackgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:textViewBackgroundColor];
    textViewBorderColorData = [NSKeyedArchiver archivedDataWithRootObject:textViewBorderColor];
    textViewTextColorData = [NSKeyedArchiver archivedDataWithRootObject:textViewTextColor];
    
    combination = @{
                    BBCOLOR_BACKGROUND: backGroundColorData,
                    BBCOLOR_BUTTON_BACKGROUND:buttonBackgroundColorData,
                    BBCOLOR_BUTTON_TITLE:buttonTitleColorData,
                    BBCOLOR_NAVI_BACKGROUND:naviBackgroundColorData,
                    BBCOLOR_NAVI_BUTTON_BACKGROUND:naviButtonBackgroundColorData,
                    BBCOLOR_NAVI_BUTTON_TITLE:naviButtonTitleColorData,
                    BBCOLOR_NAVI_TITLE:naviTitleColorData,
                    BBCOLOR_NORMALTEXT:normalTextColorData,
                    BBCOLOR_TITLETEXT:titleColorData,
                    BBCOLOR_ALERT_BACKGROUND:alertBackgroundColorData,
                    BBCOLOR_ALERT_NORMARTEXT:alertNormalTextData,
                    BBCOLOR_ALERT_TITLETEXT:alertTitleTextData,
                    BBCOLOR_ALERT_CANCEL_BACKGROUND:alertCancelBackgroundColorData,
                    BBCOLOR_ALERT_CANCEL_TITLE:alertCancelTitleColorData,
                    BBCOLOR_ALERT_OTHER_BACKGROUND:alertOtherBackgroundColorData,
                    BBCOLOR_ALERT_OTHER_TITLE:alertOtherTitleColorData,
                    BBCOLOR_LINE_VIEW:lineViewColorData,
                    BBCOLOR_TEXTFIELD_BACKGROUND:textFieldBackgroundColorData,
                    BBCOLOR_TEXTFIELD_BORDER :textFieldBorderColorData,
                    BBCOLOR_TEXTFIELD_TEXT:textFieldTextColorData,
                    BBCOLOR_TEXTVIEW_BACKGROND:textViewBackgroundColorData,
                    BBCOLOR_TEXTVIEW_BORDER:textViewBorderColorData,
                    BBCOLOR_TEXTVIEW_TEXT:textViewTextColorData
                    
                    };
    
    NSLog(@"get combination");
    return combination;
}

+ (void)setColor:(float)key{
    NSDictionary *colorCombination = [self getColorCombination:key];
    
    [self setUserDefault:BBCOLOR_BACKGROUND value:colorCombination[BBCOLOR_BACKGROUND]];
    [self setUserDefault:BBCOLOR_BUTTON_BACKGROUND value:colorCombination[BBCOLOR_BUTTON_BACKGROUND]];
    [self setUserDefault:BBCOLOR_BUTTON_TITLE value:colorCombination[BBCOLOR_BUTTON_TITLE]];
    [self setUserDefault:BBCOLOR_NAVI_BACKGROUND value:colorCombination[BBCOLOR_NAVI_BACKGROUND]];
    [self setUserDefault:BBCOLOR_NAVI_BUTTON_BACKGROUND value:colorCombination[BBCOLOR_NAVI_BUTTON_BACKGROUND]];
    [self setUserDefault:BBCOLOR_NAVI_BUTTON_TITLE value:colorCombination[BBCOLOR_NAVI_BUTTON_TITLE]];
    [self setUserDefault:BBCOLOR_NAVI_TITLE value:colorCombination[BBCOLOR_NAVI_TITLE]];
    [self setUserDefault:BBCOLOR_NORMALTEXT value:colorCombination[BBCOLOR_NORMALTEXT]];
    [self setUserDefault:BBCOLOR_TITLETEXT value:colorCombination[BBCOLOR_TITLETEXT]];
    [self setUserDefault:BBCOLOR_ALERT_BACKGROUND value:colorCombination[BBCOLOR_ALERT_BACKGROUND]];
    [self setUserDefault:BBCOLOR_ALERT_NORMARTEXT value:colorCombination[BBCOLOR_ALERT_NORMARTEXT]];
    [self setUserDefault:BBCOLOR_ALERT_TITLETEXT value:colorCombination[BBCOLOR_ALERT_TITLETEXT]];
    [self setUserDefault:BBCOLOR_ALERT_CANCEL_BACKGROUND value:colorCombination[BBCOLOR_ALERT_CANCEL_BACKGROUND]];
    [self setUserDefault:BBCOLOR_ALERT_CANCEL_TITLE value:colorCombination[BBCOLOR_ALERT_CANCEL_TITLE]];
    [self setUserDefault:BBCOLOR_ALERT_OTHER_BACKGROUND value:colorCombination[BBCOLOR_ALERT_OTHER_BACKGROUND]];
    [self setUserDefault:BBCOLOR_ALERT_OTHER_TITLE value:colorCombination[BBCOLOR_ALERT_OTHER_TITLE]];
    [self setUserDefault:BBCOLOR_LINE_VIEW value:colorCombination[BBCOLOR_LINE_VIEW]];
    
    [self setUserDefault:BBCOLOR_TEXTFIELD_BACKGROUND value:colorCombination[BBCOLOR_TEXTFIELD_BACKGROUND]];
    [self setUserDefault:BBCOLOR_TEXTFIELD_BORDER value:colorCombination[BBCOLOR_TEXTFIELD_BORDER]];
    [self setUserDefault:BBCOLOR_TEXTFIELD_TEXT value:colorCombination[BBCOLOR_TEXTFIELD_TEXT]];
    [self setUserDefault:BBCOLOR_TEXTVIEW_BACKGROND value:colorCombination[BBCOLOR_TEXTVIEW_BACKGROND]];
    [self setUserDefault:BBCOLOR_TEXTVIEW_BORDER value:colorCombination[BBCOLOR_TEXTVIEW_BORDER]];
    [self setUserDefault:BBCOLOR_TEXTVIEW_TEXT value:colorCombination[BBCOLOR_TEXTVIEW_TEXT]];
}

@end

