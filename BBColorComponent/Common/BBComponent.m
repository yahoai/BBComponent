//
//  BBComponent.m
//  BBColorComponent
//
// 컴포넌트 생성에 관련된 파일
//
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "BBComponent.h"
#import "BB.h"
@implementation BBComponent
@synthesize delegate,componentArray,timer,changeTime;

#pragma mark -
#pragma mark 싱글톤
static BBComponent *s_BBComponent;
+(BBComponent *)getBBComponent{
    if(s_BBComponent == nil){
        s_BBComponent = [[BBComponent alloc]init];
        [BBComponent getBBComponent].componentArray = [[NSMutableArray alloc]init];
    }
    return s_BBComponent;
}

+(void)setViewDelegate:(id)delegate{
    [BBComponent getBBComponent].delegate = delegate;
    [BBControl getViewList];
}

#pragma mark -
#pragma mark 정렬&사이즈

+(float)getsSreenWidth{
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    float screenWidth = screenRect.size.width;
    
    return screenWidth;
}

+(float)getsSreenHeight{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    float screenHeight =  screenRect.size.height+20;

    return screenHeight;
}

+(void)setViewCenter:(UIView *)targetView centerView:(UIView *)centerView{
    CGSize targetSize,viewSize;

    if(targetView != nil)
        targetSize = targetView.frame.size;
    else{
        float width = [BBComponent getsSreenWidth];
        float height = [BBComponent getsSreenHeight];
        targetSize = (CGSize){width,height};
    }
    viewSize = centerView.frame.size;
    
    float x = targetSize.width/2 - viewSize.width/2;
    float y = targetSize.height/2 - viewSize.height/2;
    
    centerView.frame = CGRectMake(x, y, viewSize.width, viewSize.height);
}

+(void)setVirticalCenter:(UIView *)targetView centerView:(UIView *)centerView{
    CGSize targetSize,viewSize;
    
    if(targetView != nil)
        targetSize = targetView.frame.size;
    else{
        float width = [BBComponent getsSreenWidth];
        float height = [BBComponent getsSreenHeight];
        targetSize = (CGSize){width,height};
    }
    viewSize = centerView.frame.size;
    
    float y = targetSize.height/2 - viewSize.height/2;
    
    if (centerView.tag == 1) {
        y = (targetSize.height-20)/2 - viewSize.height/2+20;
    }
    
    
    centerView.frame = CGRectMake(centerView.frame.origin.x, y, viewSize.width, viewSize.height);
}

+(CGFloat)getY:(UIView *)view{
    return view.frame.origin.y+view.frame.size.height;
}

+(CGFloat)getX:(UIView *)view{
    return view.frame.origin.x+view.frame.size.width;
}
#pragma mark -

//기본 뷰 생성
+ (BBUIView *)makeView:(CGRect)frame backgroundColor:(UIColor *)backgroundColor BBColorType:(BBColorType)type{
    BBUIView *view = [[BBUIView alloc] initWithFrame:frame];
    view.BBColorType = type;
    
    float key = [BBColor getColorKey];
    view.backgroundColor = (key > 0) ? [BBColor getColor:type] : backgroundColor;
    return view;
}

//기본 레이블 생성
+ (BBUILabel *)makeLabel:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text textColor:(UIColor *)textColor textAlign:(NSTextAlignment)textAlign font:(UIFont *)font BBColorType:(BBColorType)type{
    BBUILabel *label = [[BBUILabel alloc] initWithFrame:frame];
    label.BBColorType = type;
    
    float key = [BBColor getColorKey];
    
    
    label.text            = text;
    label.backgroundColor = (key > 0) ? [UIColor clearColor] : backgroundColor;
    label.textColor     = (key > 0) ? [BBColor getColor:type] : textColor;
    label.textAlignment = textAlign;

    label.font          = font;
    
    return label;

}

//button 생성
+ (BBUIButton *)makeButtonForCustom:(CGRect)frame backGroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor highlight:(BOOL)highlight text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font BBColorType:(BBColorType)type{
    
    BBUIButton *button = [[BBUIButton alloc]initWithFrame:frame];
    
    button.frame = frame;
    button.BBColorType = type;
    
    BBColorType backgroundType = BBColorButtonBackground;
//    BBColorType highlightType = BBColorButtonHighLight;
    BBColorType titleColorType = BBColorButtonTitle;
    BBColorType backgroundBorderType = BBColorButtonBorder;
    
    if(type == BBColorNaviButton){
        backgroundType = BBColorNaviButtonBackground;
        titleColorType = BBColorNaviButtonTitle;
        backgroundBorderType = BBColorNaviButtonBorder;
    }
    else if(type == BBColorAlertCancelButton){
        backgroundType = BBColorAlertCancelButtonBackground;
        titleColorType = BBColorAlertCancelButtonTItle;
        backgroundBorderType = BBColorAlertCancelButtonBorder;
    }
    else if(type == BBColorAlertOtherButton){
        backgroundType = BBColorAlertOtherButtonBackground;
        titleColorType = BBColorAlertOtherButtonTItle;
        backgroundBorderType = BBColorAlertOtherButtonBorder;
    }
    
    float key = [BBColor getColorKey];
    
    [button setBackgroundColor:(key > 0) ? [BBColor getColor:backgroundType] : backgroundColor];
    [button setTitle:text            forState:UIControlStateNormal];
    [button setTitleColor:(key > 0) ? [BBColor getColor:titleColorType] : textColor  forState:UIControlStateNormal];
    [button setHighlighted:highlight];
    [button.layer setCornerRadius:5];
    [button.layer setBorderWidth:1];
    [button.layer setBorderColor:(key > 0) ? [[BBColor getColor:backgroundBorderType] CGColor] : [borderColor CGColor] ];
    
    [[button titleLabel] setFont:font];
    
    return button;
}


//alertView
+ (BBUIAlertView *)makeAlertView:(UIColor *)backgroundColor backgroundBorderColor:(UIColor *)backgroundBorderColor title:(NSString *)title titleColor:(UIColor *)titleColor msg:(NSString *)msg msgColor:(UIColor *)msgColor cancelButton:(NSString *)cancelButton cancelButtonColor:(UIColor *)cancelButtonColor cancelButtonTextColor:(UIColor *)cancelButtonTextColor otherButton:(NSString *)otherButtun otherButtonColor:(UIColor *)otherButtonColor otherButtonTextColor:(UIColor *)otherButtonTextColor delegate:(id)delegate{
    
    float key = [BBColor getColorKey];
    
    BBUIAlertView *alert = [[BBUIAlertView alloc]initWithFrame:(CGRect){0,0,[BBComponent getsSreenWidth]-80,0} delegate:delegate];
    alert.BBColorType = BBColorAlertView;
    
    NSAttributedString *msgString = [[NSAttributedString alloc]initWithString:msg attributes:@{NSFontAttributeName:DEFAULT_FONT_12}];
    CGRect rect = [msgString boundingRectWithSize:(CGSize){alert.backgroundView.frame.size.width-40,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize msgSize = rect.size;
    
    alert.title.text = title;
    alert.message.text = msg;
    
    alert.backgroundView.backgroundColor = (key > 0) ? [BBColor getColor:BBColorAlertBackground] : backgroundColor;
    alert.backgroundView.layer.borderColor = (key > 0) ? [[BBColor getColor:BBColorAlertBackground] CGColor] : [backgroundColor CGColor];
    alert.backgroundView.layer.borderWidth = 1;
    
    alert.title.textColor = (key > 0) ? [BBColor getColor:BBColorAlertTitleText] : titleColor;
    alert.message.textColor = (key > 0) ? [BBColor getColor:BBColorAlertNormalText] : msgColor;
    
    alert.message.frame = (CGRect){20, [BBComponent getY:alert.title]+10, alert.backgroundView.frame.size.width-40, msgSize.height};
    alert.cancelBtn.frame = (CGRect){20, [BBComponent getY:alert.message]+20, alert.backgroundView.frame.size.width-40, 40};
    alert.otherBtn.frame = (CGRect){20,[BBComponent getY:alert.cancelBtn]+10, alert.backgroundView.frame.size.width-40, 40};
    
    [alert.cancelBtn setTitle:cancelButton forState:UIControlStateNormal];
    [alert.cancelBtn setBackgroundColor:(key > 0) ? [BBColor getColor:BBColorButtonBackground] : cancelButtonTextColor];
    [alert.cancelBtn setTitleColor:(key > 0) ? [BBColor getColor:BBColorButtonTitle] : cancelButtonColor forState:UIControlStateNormal];
    
    [alert.otherBtn setTitle:otherButtun forState:UIControlStateNormal];
    [alert.otherBtn setBackgroundColor:(key > 0) ? [BBColor getColor:BBColorButtonBackground] : otherButtonTextColor];
    [alert.otherBtn setTitleColor:(key > 0) ? [BBColor getColor:BBColorButtonTitle] : otherButtonColor forState:UIControlStateNormal];
    
    float height =[BBComponent getY:alert.otherBtn]+20;
    if(otherButtun == nil){
        height =[BBComponent getY:alert.cancelBtn]+20;
        alert.otherBtn.hidden = YES;
    }
    
    alert.backgroundView.frame = CGRectMake(0, 0, alert.frame.size.width, height);
    alert.frame = CGRectMake(0, 0, alert.frame.size.width, height);
    [BBComponent setViewCenter:nil centerView:alert];

    
    return alert;
}

//네비뷰 생성
+ (BBUINaviView *)makeNaviView:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor  bottomLineColor:(UIColor *)bottomLineColor delegate:(id)delegate{
    BBUINaviView *view = [[BBUINaviView alloc]initWithFrame:frame];
    view.BBColorType = BBColorNaviBackground;
    
    float key = [BBColor getColorKey];
    view.backgroundView.backgroundColor = (key > 0) ? [BBColor getColor:BBColorNaviBackground] : backgroundColor;
    view.bottomLine.backgroundColor = (key > 0)? [BBColor getColor:BBColorNaviBottomLine] : bottomLineColor;
    view.delegate = delegate;
    
    NSAttributedString *titleAttString = [[NSAttributedString alloc]initWithString:title attributes:@{NSFontAttributeName:DEFAULT_FONT_15}];
    CGRect rect = [titleAttString boundingRectWithSize:(CGSize){view.frame.size.width-40,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize msgSize = rect.size;
    
    view.title.frame = CGRectMake(0, 20, view.frame.size.width, msgSize.height);
    view.title.text = title;
    view.title.textColor = (key > 0) ? [BBColor getColor:BBColorNaviTitle] : titleColor;
    view.title.backgroundColor = COLOR_CLEAR;
    view.title.textAlignment = NSTextAlignmentCenter;
    view.title.font = DEFAULT_FONT_15;
    view.title.tag = 1;//네비 타이틀 일 경우 1
    [self setVirticalCenter:view centerView:view.title];

    
    return view;
    
}

+ (BBUITextField *)makeTextField:(CGRect)frame backGroudColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor placeholder:(NSString *)placeholder borderColor:(UIColor *)borderColor borderSize:(float)borderSize delegate:(id)delegate{
    
    BBUITextField *textField = [[BBUITextField alloc]initWithFrame:frame delegate:delegate];
    textField.BBColorType = BBColorTextField;
    float key = [BBColor getColorKey];
    
    textField.backgroundView.backgroundColor = (key > 0) ? [BBColor getColor:BBColorTextFieldBackground] : backgroundColor;
    textField.textField.textColor = (key > 0) ? [BBColor getColor:BBColorTextFieldText] : textColor;
    textField.textField.delegate = delegate;
    textField.backgroundView.layer.borderColor  = (key > 0) ? [[BBColor getColor:BBColorTextFieldBorder] CGColor] : [textColor CGColor];
    textField.backgroundView.layer.borderWidth = borderSize;
    textField.textField.placeholder = placeholder;
    
    return textField;
}

+ (BBUITextView *)makeTextView:(CGRect)frame backGroudColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderSize:(float)borderSize delegate:(id)delagate{
    
    BBUITextView *textView = [[BBUITextView alloc]initWithFrame:frame];
    textView.BBColorType = BBColorTextView;
    float key = [BBColor getColorKey];
    
    textView.backgroundColor = (key > 0) ? [BBColor getColor:BBColorTextViewBackground] : backgroundColor;
    textView.textColor = (key > 0) ? [BBColor getColor:BBColorTextViewText] : textColor;
    textView.layer.borderColor = (key > 0) ? [[BBColor getColor:BBColorTextViewBorder] CGColor] : [textColor CGColor];
    textView.layer.borderWidth = borderSize;

    return textView;
}


@end


#pragma mark -
#pragma mark 클래스 오버라이딩
@implementation BBUIView
@synthesize isBBComponent,BBColorType;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        isBBComponent = YES;
    }
    return self;
}

-(BOOL)getisBBComponent{
    return isBBComponent;
}
@end



@implementation BBUIButton
@synthesize isBBComponent,BBColorType;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        isBBComponent = YES;
    }
    return self;
}
-(BOOL)getisBBComponent{
    return isBBComponent;
}
@end



@implementation BBUILabel
@synthesize isBBComponent,BBColorType;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        isBBComponent = YES;
    }
    return self;
}
-(BOOL)getisBBComponent{
    return isBBComponent;
}
@end




@implementation BBUIAlertView
@synthesize delegate = _delegate;
-(instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate{
    self = [super initWithFrame:frame];
    if(self){
        _delegate = delegate;
        self.overlayView = [BBComponent makeView:CGRectMake(0, 0, [BBComponent getsSreenWidth], [BBComponent getsSreenHeight]) backgroundColor:COLOR_000000 BBColorType:BBColorAlertOverlay];

        
        self.backgroundView = [BBComponent makeView:CGRectMake(0, 0, [BBComponent getsSreenWidth]-80, 0) backgroundColor:COLOR_FFFFFF BBColorType:BBColorAlertBackground];
        self.title = [BBComponent makeLabel:CGRectMake(20, 20, self.backgroundView.frame.size.width-40, 20) backgroundColor:COLOR_CLEAR text:@"Title" textColor:COLOR_000000 textAlign:NSTextAlignmentCenter font:DEFAULT_FONT_20_BOLD BBColorType:BBColorAlertTitleText];
        
        self.message = [BBComponent makeLabel:CGRectMake(20, [BBComponent getY:self.title]+10, self.backgroundView.frame.size.width-40, 0) backgroundColor:COLOR_CLEAR text:@"Message" textColor:COLOR_000000 textAlign:NSTextAlignmentCenter font:DEFAULT_FONT_12 BBColorType:BBColorAlertNormalText];
        [self.message setLineBreakMode:NSLineBreakByWordWrapping];
        [self.message setNumberOfLines:0];
        
        self.cancelBtn = [BBComponent makeButtonForCustom:CGRectMake(20, [BBComponent getY:self.message]+20, self.backgroundView.frame.size.width-40, 40) backGroundColor:COLOR_CLEAR borderColor:COLOR_CLEAR highlight:YES text:@"Cancel Buttton" textColor:COLOR_000000 font:DEFAULT_FONT_15 BBColorType:BBColorAlertCancelButton];
        
        self.cancelBtn.tag = 0;
        [self.cancelBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        self.otherBtn = [BBComponent makeButtonForCustom:CGRectMake(20, [BBComponent getY:self.cancelBtn]+10, self.backgroundView.frame.size.width-40, 40) backGroundColor:COLOR_CLEAR borderColor:COLOR_CLEAR highlight:YES  text:@"Other Button" textColor:COLOR_000000 font:DEFAULT_FONT_15 BBColorType:BBColorAlertOtherButton];
        
        self.otherBtn.tag = 1;
        [self.otherBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundView.layer.cornerRadius = 5;
        self.cancelBtn.layer.cornerRadius = 5;
        self.otherBtn.layer.cornerRadius = 5;
        
        [self addSubview:self.overlayView];
        [self addSubview:self.backgroundView];
        [self.backgroundView addSubview:self.title];
        [self.backgroundView addSubview:self.message];
        [self.backgroundView addSubview:self.cancelBtn];
        [self.backgroundView addSubview:self.otherBtn];
        
    }
    
    return self;
}


-(void)selectedBtn:(BBUIButton *)sender{
    if([_delegate respondsToSelector:@selector(selectedBtn:)])
        [_delegate selectedBtn:sender];
}

@end





@implementation BBUINaviView
@synthesize leftBtn,rightBtn,title,delegate,bottomLine;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundView = [BBComponent makeView:CGRectMake(0, 0, frame.size.width, frame.size.height) backgroundColor:COLOR_FFFFFF BBColorType:BBColorNaviBackground];

        title = [BBComponent makeLabel:CGRectMake(0, 0, frame.size.width, 16) backgroundColor:COLOR_CLEAR text:@"Title" textColor:COLOR_000000 textAlign:NSTextAlignmentCenter font:DEFAULT_FONT_15 BBColorType:BBColorNaviTitle];
        leftBtn = [BBComponent makeButtonForCustom:CGRectMake(10, 20+10, 70, 25) backGroundColor:COLOR_CLEAR borderColor:COLOR_CLEAR highlight:YES  text:@"LEFT" textColor:COLOR_000000 font:DEFAULT_FONT_12 BBColorType:BBColorNaviButton];
        rightBtn = [BBComponent makeButtonForCustom:CGRectMake(frame.size.width-80, 20+10, 70, 25) backGroundColor:COLOR_CLEAR borderColor:COLOR_CLEAR highlight:YES  text:@"RIGHT" textColor:COLOR_000000 font:DEFAULT_FONT_12 BBColorType:BBColorNaviButton];
        
        [leftBtn addTarget:self action:@selector(onLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        [rightBtn addTarget:self action:@selector(onRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        bottomLine = [BBComponent makeView:(CGRect){0,frame.size.height,frame.size.width,1} backgroundColor:COLOR_CLEAR BBColorType:BBColorNaviBottomLine];

        [self addSubview:self.backgroundView];
        [self.backgroundView addSubview:leftBtn];
        [self.backgroundView addSubview:rightBtn];
        [self.backgroundView addSubview:title];
        [self.backgroundView addSubview:bottomLine];
    }
    
    return self;
}

-(void)onLeftBtn:(id)sender{
    if([self.delegate respondsToSelector:@selector(onLeftBtn:)])
        [self.delegate onLeftBtn:sender];
}

-(void)onRightBtn:(id)sender{
    if([self.delegate respondsToSelector:@selector(onRightBtn:)])
        [self.delegate onRightBtn:sender];
}

@end


@implementation BBUITableView
@synthesize isBBComponent,BBColorType;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        isBBComponent = YES;
    }
    return self;
}

-(BOOL)getisBBComponent{
    return isBBComponent;
}
@end


@implementation BBUITextField
@synthesize backgroundView,textField;
-(instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate{
    self = [super initWithFrame:frame];
    if(self){
        backgroundView = [BBComponent makeView:CGRectMake(0, 0, frame.size.width, frame.size.height) backgroundColor:COLOR_CLEAR BBColorType:BBColorTextFieldBackground];
        
        textField = [[UITextField alloc]initWithFrame:(CGRect){5,3,frame.size.width-10,frame.size.height-6}];
        textField.backgroundColor = COLOR_CLEAR;
        textField.delegate = delegate;
        [backgroundView addSubview:textField];
        [self addSubview:backgroundView];
        
        
    }
    return self;
}

@end



@implementation BBUITextView
@synthesize isBBComponent,BBColorType;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        isBBComponent = YES;
    }
    return self;
}

-(BOOL)getisBBComponent{
    return isBBComponent;
}
@end


