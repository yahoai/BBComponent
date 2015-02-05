//
//  BBUIAlertViewController.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 25..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "BBUIAlertViewController.h"

@interface BBUIAlertViewController (){
    BBUILabel *rstLabel;
    BBUIAlertView *alert;
}

@end

@implementation BBUIAlertViewController

-(void)drawView{
    
    BBUIView *backgroundView = [BBComponent makeView:(CGRect){0,20+45,[BBComponent getsSreenWidth],[BBComponent getsSreenHeight]-20-45} backgroundColor:COLOR_000000 BBColorType:BBColorBackground];
    
    
    BBUINaviView *naviView = [BBComponent makeNaviView:(CGRect){0,0,[BBComponent getsSreenWidth],45+20} backgroundColor:COLOR_000000 title:@"BBUIButton" titleColor:COLOR_000000 bottomLineColor:COLOR_000000 delegate:self];
    [naviView.leftBtn setTitle:@"BACK" forState:UIControlStateNormal];
    [naviView.rightBtn setTitle:@"색 변경" forState:UIControlStateNormal];
    
    
    BBUILabel *titleLable = [BBComponent makeLabel:(CGRect){10,100,150,20} backgroundColor:COLOR_000000 text:@"BBUIAlertView" textColor:COLOR_000000 textAlign:NSTextAlignmentLeft font:DEFAULT_FONT_20_BOLD BBColorType:BBColorTitleText];

    
    BBUIButton *btn = [BBComponent makeButtonForCustom:(CGRect){10,150,150,40} backGroundColor:COLOR_000000 borderColor:COLOR_CLEAR highlight:YES text:@"버튼을 누르세요" textColor:COLOR_000000 font:DEFAULT_FONT_20_BOLD BBColorType:BBColorButton];
    
    [btn addTarget:self action:@selector(onAlert) forControlEvents:UIControlEventTouchUpInside];
    
     rstLabel = [BBComponent makeLabel:(CGRect){10,210,150,20} backgroundColor:COLOR_000000 text:@"" textColor:COLOR_000000 textAlign:NSTextAlignmentLeft font:DEFAULT_FONT_20_BOLD BBColorType:BBColorTitleText];
    
    [self.view addSubview:backgroundView];
    [self.view addSubview:naviView];
    [self.view addSubview:btn];
    [self.view addSubview:titleLable];
    [self.view addSubview:rstLabel];
    
}

-(void)onAlert{
    alert = [BBComponent makeAlertView:COLOR_000000 backgroundBorderColor:COLOR_CLEAR title:@"경고창" titleColor:COLOR_000000 msg:@"이것은 경고창입니다.\n어떻게 쓰는지는 다 알죠?" msgColor:COLOR_000000 cancelButton:@"아니요. 모르겠어요." cancelButtonColor:COLOR_000000 cancelButtonTextColor:COLOR_000000 otherButton:@"네. 압니다." otherButtonColor:COLOR_000000 otherButtonTextColor:COLOR_000000 delegate:self];
    alert.delegate = self;
    [self.view addSubview:alert];
}

-(void)selectedBtn:(BBUIButton *)sender{
    if(sender.tag == 0){
        rstLabel.text = @"화이팅! 힘내세요!";
    }
    else if(sender.tag == 1){
        rstLabel.text = @"올~~ - _-)=b";
    }
    
    [alert removeFromSuperview];
}

-(void)onLeftBtn:(id)sender{
    [BBControl removeNoUseViews:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)onRightBtn:(id)sender{
    [BBControl changeColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawView];
    [BBComponent setViewDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
