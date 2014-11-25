//
//  BBUIButtonViewController.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 25..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "BBUIButtonViewController.h"

@interface BBUIButtonViewController ()

@end

@implementation BBUIButtonViewController

-(void)drawView{
    
    BBUIView *backgroundView = [BBComponent makeView:(CGRect){0,20+45,[BBComponent getsSreenWidth],[BBComponent getsSreenHeight]-20-45} backgroundColor:COLOR_000000 BBColorType:BBColorBackground];
    
    
    BBUINaviView *naviView = [BBComponent makeNaviView:(CGRect){0,0,[BBComponent getsSreenWidth],45+20} backgroundColor:COLOR_000000 title:@"BBUIButton" titleColor:COLOR_000000 delegate:self];
    [naviView.leftBtn setTitle:@"BACK" forState:UIControlStateNormal];
    [naviView.rightBtn setTitle:@"색 변경" forState:UIControlStateNormal];
    
    BBUIButton *btn = [BBComponent makeButtonForCustom:(CGRect){10,100,150,30} backGroundColor:COLOR_000000 highlight:YES text:@"BBUIButton" textColor:COLOR_000000 font:DEFAULT_FONT_20_BOLD BBColorType:BBColorButton];
    
    
    BBUILabel *textLabel = [BBComponent makeLabel:(CGRect){10,140,[BBComponent getsSreenWidth],140} backgroundColor:COLOR_000000
                                             text:@"Button 종류\n유형에 맞춰서 사용하세요.\n\nBBColorButton\nBBColorNaviButton(Default)\nBBColorAlertCancelButton(Default)\nBBColorAlertOtherButton(Default)"
                                        textColor:COLOR_000000
                                        textAlign:NSTextAlignmentLeft
                                             font:DEFAULT_FONT_15
                                      BBColorType:BBColorTitleText];
    
    [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [textLabel setNumberOfLines:0];
    
    
    [self.view addSubview:backgroundView];
    [self.view addSubview:naviView];
    [self.view addSubview:btn];
    [self.view addSubview:textLabel];

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
