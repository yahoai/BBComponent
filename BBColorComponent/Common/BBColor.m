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
            
        default:
            break;
    }
    
//    NSLog(@"type : %d data: %@",type,data?@"data":@"null");
    UIColor *color;
    if(data != nil)
        color = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
//    if(BBColorTitleText == type)
//        NSLog(@"%d: %@",type,color);

    return color;
}

+ (NSDictionary *)getColorCombination:(float)key{
    NSDictionary *combination = [[NSDictionary alloc]init];
    
    UIColor *backGroundColor,*buttonTitleColor,*buttonBackgroundColor,*naviBackgroundColor,*naviButtonTitleColor,*naviButtonBackgroundColor,*naviTitleColor,*normalTextColor,*titleColor,*alertBackgroundColor,*alertNormalText,*alertTitleText,*alertCacncelBackgroundColor,*alertCancelTitleColor,*alertOtherBackgroundColor,*alertOtherTitleColor,*lineViewColor;
    
    NSData *backGroundColorData,*buttonTitleColorData,*buttonBackgroundColorData,*naviBackgroundColorData,*naviButtonTitleColorData,*naviButtonBackgroundColorData,*naviTitleColorData,*normalTextColorData,*titleColorData,*alertBackgroundColorData,*alertNormalTextData,*alertTitleTextData,*alertCancelBackgroundColorData,*alertCancelTitleColorData,*alertOtherBackgroundColorData,*alertOtherTitleColorData,*lineViewColorData;
    
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
    }
    
    if(key == 3){
        backGroundColor = UIColorFromRGB(0x72B93C);
        buttonBackgroundColor = UIColorFromRGB(0xffffff);
        buttonTitleColor = COLOR_FFFFFF;
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
                    BBCOLOR_LINE_VIEW:lineViewColorData
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
    
}

@end

