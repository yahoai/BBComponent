//
//  BBUiViewController.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 25..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "BBUiViewController.h"

@implementation BBUiViewController



-(void)drawView{
    
    BBUIView *backgroundView = [BBComponent makeView:(CGRect){0,20+45,[BBComponent getsSreenWidth],[BBComponent getsSreenHeight]-20-45} backgroundColor:COLOR_000000 BBColorType:BBColorBackground];
    
    
    BBUINaviView *naviView = [BBComponent makeNaviView:(CGRect){0,0,[BBComponent getsSreenWidth],45+20} backgroundColor:COLOR_000000 title:@"BBUIView" titleColor:COLOR_000000 bottomLineColor:COLOR_000000 delegate:self];
    [naviView.leftBtn setTitle:@"BACK" forState:UIControlStateNormal];
    [naviView.rightBtn setTitle:@"색 변경" forState:UIControlStateNormal];
    
    BBUILabel *titleLable = [BBComponent makeLabel:(CGRect){10,100,150,20} backgroundColor:COLOR_000000 text:@"BBUIView" textColor:COLOR_000000 textAlign:NSTextAlignmentLeft font:DEFAULT_FONT_20_BOLD BBColorType:BBColorTitleText];
    
    BBUIView *line = [BBComponent makeView:(CGRect) {10,125,150,1} backgroundColor:COLOR_000000 BBColorType:BBColorLineView];
    
    
    BBUILabel *textLabel = [BBComponent makeLabel:(CGRect){10,130,[BBComponent getsSreenWidth],140} backgroundColor:COLOR_000000
                                             text:@"VIew 종류\n유형에 맞춰서 사용하세요.\n\nBBColorBackground\nBBColorNaviBackground(Default)\nBBColorAlertBackground(Default)\nBBColorLineView"
                                        textColor:COLOR_000000
                                        textAlign:NSTextAlignmentLeft
                                             font:DEFAULT_FONT_15
                                      BBColorType:BBColorTitleText];
    
    [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [textLabel setNumberOfLines:0];

    
    [self.view addSubview:backgroundView];
    [self.view addSubview:naviView];
    [self.view addSubview:titleLable];
    [self.view addSubview:textLabel];
    [self.view addSubview:line];
}

-(void)onLeftBtn:(id)sender{
    [BBControl removeNoUseViews:self];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)onRightBtn:(id)sender{
    [BBControl changeColor];
}


-(void)viewDidLoad{
    [super viewDidLoad];
    [self drawView];
    [BBComponent setViewDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
