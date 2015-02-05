//
//  BBComponent.h
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BB.h"


#pragma mark -
#pragma mark BBUIView
@interface BBUIView : UIView
@property(readonly) BOOL isBBComponent;
@property (nonatomic) enum BBColorType BBColorType;
-(BOOL)getisBBComponent;
@end

#pragma mark -
#pragma mark BBUIButton

@interface BBUIButton : UIButton
@property(readonly) BOOL isBBComponent;
@property (nonatomic) enum BBColorType BBColorType;
-(BOOL)getisBBComponent;
@end


#pragma mark -
#pragma mark BBUILabel

@interface BBUILabel : UILabel
@property(readonly) BOOL isBBComponent;
@property (nonatomic) enum BBColorType BBColorType;
-(BOOL)getisBBComponent;
@end

#pragma mark -
#pragma mark BBUIAlertView

@protocol BBUIAlertViewDelegate <NSObject>

@optional
-(void)selectedBtn:(BBUIButton *)sender;
@end


@interface BBUIAlertView : BBUIView
-(instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate;
@property (nonatomic,strong)BBUIView *overlayView;
@property (nonatomic,strong)BBUIView *backgroundView;
@property (nonatomic,strong)BBUILabel *title;
@property (nonatomic,strong)BBUILabel *message;
@property (nonatomic,strong)BBUIButton *cancelBtn,*otherBtn;
@property (nonatomic,weak)id <BBUIAlertViewDelegate> delegate;
@end

#pragma mark -
#pragma mark BBUINaviView

//naviView delegate
@protocol BBUINaviViewDelegate <NSObject>
@optional
-(void)onLeftBtn:(id)sender;
-(void)onRightBtn:(id)sender;

@end


@interface BBUINaviView : BBUIView
@property (nonatomic,strong)BBUIView *backgroundView;
@property (nonatomic,strong)BBUIView *bottomLine;
@property (nonatomic,strong)BBUILabel *title;
@property (nonatomic,strong)BBUIButton *leftBtn,*rightBtn;
@property (nonatomic,weak)id <BBUINaviViewDelegate> delegate;

@end

#pragma mark -
#pragma mark BBTableView

@interface BBUITableView : UITableView
@property(readonly) BOOL isBBComponent;
@property (nonatomic) enum BBColorType BBColorType;
-(BOOL)getisBBComponent;
@end


#pragma mark -
#pragma mark BBUITextField

@interface BBUITextField : BBUIView
@property (nonatomic,strong) BBUIView *backgroundView;
@property (nonatomic,strong) UITextField *textField;
-(instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate;
@end


#pragma mark -
#pragma mark BBUITextView

@interface BBUITextView : UITextView
@property(readonly) BOOL isBBComponent;
@property (nonatomic) enum BBColorType BBColorType;
-(BOOL)getisBBComponent;
@end


#pragma mark -
#pragma mark BBComponent

@interface BBComponent : NSObject
@property (nonatomic,assign) id delegate;
@property (nonatomic,strong) NSMutableArray *componentArray;
@property (nonatomic,strong) NSTimer *timer;
@property float changeTime;
+(BBComponent *)getBBComponent;
+(void)setViewDelegate:(id)delegate;


//정렬 및 사이즈
+ (float)getsSreenWidth;
+ (float)getsSreenHeight;
+ (void)setViewCenter:(UIView *)targetView centerView:(UIView *)centerView;
+ (CGFloat)getY:(UIView *)view;
+ (CGFloat)getX:(UIView *)view;


+ (BBUILabel *)makeLabel:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text textColor:(UIColor *)textColor textAlign:(NSTextAlignment)textAlign font:(UIFont *)font BBColorType:(BBColorType)type;
+ (BBUIView *)makeView:(CGRect)frame backgroundColor:(UIColor *)backgroundColor  BBColorType:(BBColorType)type;
+ (BBUIAlertView *)makeAlertView:(UIColor *)backgroundColor backgroundBorderColor:(UIColor *)backgroundBorderColor title:(NSString *)title titleColor:(UIColor *)titleColor msg:(NSString *)msg msgColor:(UIColor *)msgColor cancelButton:(NSString *)cancelButton cancelButtonColor:(UIColor *)cancelButtonColor cancelButtonTextColor:(UIColor *)cancelButtonTextColor otherButton:(NSString *)otherButtun otherButtonColor:(UIColor *)otherButtonColor otherButtonTextColor:(UIColor *)otherButtonTextColor delegate:(id)delegate;
+ (BBUINaviView *)makeNaviView:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor bottomLineColor:(UIColor *)bottomLineColor delegate:(id)delegate;
+ (BBUIButton *)makeButtonForCustom:(CGRect)frame backGroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor highlight:(BOOL)highlight text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font  BBColorType:(BBColorType)type;

+ (BBUITextField *)makeTextField:(CGRect)frame backGroudColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor placeholder:(NSString *)placeholder borderColor:(UIColor *)borderColor borderSize:(float)borderSize delegate:(id)delegate;

+ (BBUITextView *)makeTextView:(CGRect)frame backGroudColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderSize:(float)borderSize delegate:(id)delagate;




@end

