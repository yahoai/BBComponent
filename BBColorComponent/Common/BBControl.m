//
//  BBControl.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "BBControl.h"
#import "BB.h"
@implementation BBControl


//색 오토 체인지 시작
+(void)autoChangeStart {
    float key = [BBColor getColorKey];
    NSLog(@"%f",key);
    if(key == 0)
        [BBColor setColorKey];
    
//    [BBComponent getBBComponent].timer = [NSTimer scheduledTimerWithTimeInterval:15.0
//                                     target:self
//                                   selector:@selector(changeColor)
//                                   userInfo:nil
//                                    repeats:YES];
}

//오토체인지 스탑
+(void)stop{
    [[BBComponent getBBComponent].timer invalidate];
    [BBComponent getBBComponent].timer = nil;
}

+(void)changeColor{
    [BBColor setColorKey];
    [BBControl getViewList];
    
    NSArray *bbViewArray = [BBComponent getBBComponent].componentArray;

//    NSLog(@"%d",bbViewArray.count);
    for(BBUIView *view in bbViewArray){
        [self animateFromType:view.BBColorType view:view];
    }
}


//타입에 따른 배경&텍스트 색상 에니메이트
+ (void)animateFromType:(BBColorType )type view:(id)view{
    int intervalTime = 2;
    switch (type) {
        case BBColorLineView:
        case BBColorBackground:{
            BBUIView *bbView = (BBUIView *)view;
            [UIView animateWithDuration:intervalTime animations:^{
                bbView.backgroundColor = [BBColor getColor:type];
            }];
            break;
        }
        case BBColorNaviButton:{
            BBUIButton *component = (BBUIButton *)view;
            [UIView animateWithDuration:intervalTime animations:^{
                component.backgroundColor = [BBColor getColor:BBColorNaviButtonBackground];
                [component setTitleColor:[BBColor getColor:BBColorNaviButtonTitle] forState:UIControlStateNormal];
            }];
            break;
        }
        case BBColorAlertOtherButton:{
            BBUIButton *component = (BBUIButton *)view;
            [UIView animateWithDuration:intervalTime animations:^{
                component.backgroundColor = [BBColor getColor:BBColorAlertOtherButtonBackground];
                [component setTitleColor:[BBColor getColor:BBColorAlertOtherButtonTItle] forState:UIControlStateNormal];
            }];
            break;
        }
        case BBColorAlertCancelButton:{
            BBUIButton *component = (BBUIButton *)view;
            [UIView animateWithDuration:intervalTime animations:^{
                component.backgroundColor = [BBColor getColor:BBColorAlertCancelButtonBackground];
                [component setTitleColor:[BBColor getColor:BBColorAlertCancelButtonTItle] forState:UIControlStateNormal];
            }];
            break;
        }
        case BBColorAlertBackground:
        case BBColorNaviBackground:{
            BBUIView *component = (BBUIView *)view;
            [UIView animateWithDuration:intervalTime animations:^{
                component.backgroundColor = [BBColor getColor:type];
            }];
            break;
        }

        case BBColorButton:{
            BBUIButton *component = (BBUIButton *)view;
            [UIView animateWithDuration:intervalTime animations:^{
                component.backgroundColor = [BBColor getColor:BBColorButtonBackground];
                [component setTitleColor:[BBColor getColor:BBColorButtonTitle] forState:UIControlStateNormal];
            }];
            break;
        }
        case BBColorNaviTitle:
        case BBColorAlertNormalText:
        case BBColorAlertTitleText:
        case BBColorTitleText:
        case BBColorNormalText:{
            BBUILabel *component = (BBUILabel *)view;
            [UIView transitionWithView:component duration:intervalTime options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                component.textColor = [BBColor getColor:type];
            } completion:nil];
            break;
        }
        
        default:
            break;
    }
}



+ (void)getViewList{
    UIViewController *viewController = [BBComponent getBBComponent].delegate;
    UIView *view = viewController.view;
    [BBControl checkSubviews:view remove:NO];
}

+ (void)removeNoUseViews:(UIViewController *)delegate{
    UIView *view = delegate.view;
    [self checkSubviews:view remove:YES];
}

//BBComponent를 찾아내는 함수
+ (void)checkSubviews:(UIView *)view remove:(BOOL)remove{
    for(int i=0;i<view.subviews.count;i++){
        if([view.subviews[i] respondsToSelector:@selector(getisBBComponent)]){
            [BBControl checkSubviews:view.subviews[i] remove:remove];
            
            if(![view.subviews[i] isKindOfClass:[BBUITableView class]]){
                if(!remove){
                    if(![[BBComponent getBBComponent].componentArray isEqual:view.subviews[i]])
                        [[BBComponent getBBComponent].componentArray addObject:view.subviews[i]];
                }
                else
                    [[BBComponent getBBComponent].componentArray removeObject:view.subviews[i]];
            }
        }
    }
}

@end
