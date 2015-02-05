//
//  BBUITextFieldViewController.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2015. 1. 13..
//  Copyright (c) 2015년 yahoai. All rights reserved.
//

#import "BBUITextFieldViewController.h"

@interface BBUITextFieldViewController ()

@end

@implementation BBUITextFieldViewController

-(void)drawView{
    
    BBUIView *backgroundView = [BBComponent makeView:(CGRect){0,20+45,[BBComponent getsSreenWidth],[BBComponent getsSreenHeight]-20-45} backgroundColor:COLOR_000000 BBColorType:BBColorBackground];
    
    
    BBUINaviView *naviView = [BBComponent makeNaviView:(CGRect){0,0,[BBComponent getsSreenWidth],45+20} backgroundColor:COLOR_000000 title:@"BBUIButton" titleColor:COLOR_000000  bottomLineColor:COLOR_000000 delegate:self];
    [naviView.leftBtn setTitle:@"BACK" forState:UIControlStateNormal];
    [naviView.rightBtn setTitle:@"색 변경" forState:UIControlStateNormal];
    
    
    BBUILabel *titleLable = [BBComponent makeLabel:(CGRect){10,100,150,20} backgroundColor:COLOR_000000 text:@"BBUITextField" textColor:COLOR_000000 textAlign:NSTextAlignmentLeft font:DEFAULT_FONT_20_BOLD BBColorType:BBColorTitleText];


    BBUITextField *textField = [BBComponent makeTextField:(CGRect){10,130,[BBComponent getsSreenWidth]-20,25} backGroudColor:COLOR_000000 textColor:COLOR_000000 placeholder:@"TextField1" borderColor:COLOR_000000 borderSize:1 delegate:self];

    BBUITextField *textField2 = [BBComponent makeTextField:(CGRect){10,[BBComponent getY:textField]+10,[BBComponent getsSreenWidth]-20,25} backGroudColor:COLOR_000000 textColor:COLOR_000000 placeholder:@"TextField2" borderColor:COLOR_000000 borderSize:1 delegate:self];

    
    BBUILabel *textLabel = [BBComponent makeLabel:(CGRect){10,[BBComponent getY:textField2]+20,[BBComponent getsSreenWidth]-20,140} backgroundColor:COLOR_000000
                                             text:@"TextField 변경 가능 값들\n\nBackgroundColor\nTextColor\nPlaceHolder\nBorderColor\nBorderSize"
                                        textColor:COLOR_000000
                                        textAlign:NSTextAlignmentLeft
                                             font:DEFAULT_FONT_15
                                      BBColorType:BBColorTitleText];
    
    [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [textLabel setNumberOfLines:0];
    
    [self.view addSubview:backgroundView];
    [self.view addSubview:naviView];
    [self.view addSubview:textLabel];
    [self.view addSubview:titleLable];
    [self.view addSubview:textField];
    [self.view addSubview:textField2];

    
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
