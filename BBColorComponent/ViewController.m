//
//  ViewController.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "ViewController.h"
#import "BB.h"
#import "Cell.h"
#import "LabelViewController.h"
#import "BBUiViewController.h"
#import "BBUIButtonViewController.h"
#import "BBUIAlertViewController.h"
#import "BBUITextFieldViewController.h"
#import "BBUITextViewController.h"

@interface ViewController () <BBUINaviViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    BBUITableView *table;
}

@end

@implementation ViewController


- (void)drawView{
    
    BBUINaviView *naviView = [BBComponent makeNaviView:CGRectMake(0,0, [BBComponent getsSreenWidth], 20+45) backgroundColor:COLOR_FFFFFF title:@"BBComponent" titleColor:COLOR_000000 delegate:self];
    naviView.leftBtn.hidden = YES;
    [naviView.rightBtn setTitle:@"색 변경" forState:UIControlStateNormal];

    
    table = [[BBUITableView alloc]initWithFrame:(CGRect){0,20+45,[BBComponent getsSreenWidth],[BBComponent getsSreenHeight]-20-45} style:UITableViewStylePlain];
    table.backgroundColor = COLOR_FFFFFF;
    table.delegate = self;
    table.dataSource = self;
    
    
    [self.view addSubview:naviView];
    [self.view addSubview:table];
    
  
}

-(void)onLeftBtn:(id)sender{
    NSLog(@"left btn");
}

-(void)onRightBtn:(id)sender{
    [BBControl changeColor];
}

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawView];
    [BBComponent setViewDelegate:self];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [BBComponent setViewDelegate:self];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// Return the number of rows in the section.
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...

    if(indexPath.row == 0){
        cell.title.text = @"비비유아이뷰";
        cell.subTitle.text = @"BBUIView";
    }
    else if(indexPath.row == 1){
        cell.title.text = @"비비유아이레이블";
        cell.subTitle.text = @"BBUILabel";
    }
    else if(indexPath.row == 2){
        cell.title.text = @"비비유아이버튼";
        cell.subTitle.text = @"BBUILabel";
    }
    else if(indexPath.row == 3){
        cell.title.text = @"비비유아이경고창";
        cell.subTitle.text = @"BBUIAlertView";
    }
    else if(indexPath.row == 4){
        cell.title.text = @"비비유아이글자입력공간";
        cell.subTitle.text = @"BBUITextField";
    }
    else if(indexPath.row == 5){
        cell.title.text = @"비비유아이글자입력창";
        cell.subTitle.text = @"BBUITextView";
    }
        
    else{
        cell.title.text = @"Title Text";
        cell.subTitle.text = @"Sub Title Text";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    [BBControl checkSubviews:cell remove:NO];
    return cell;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [BBControl checkSubviews:cell remove:YES];
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0){
        BBUiViewController *buvc = [[BBUiViewController alloc]init];
        [self.navigationController pushViewController:buvc animated:YES];
    }
    else if(indexPath.row == 1){
        LabelViewController *lvc = [[LabelViewController alloc]init];
        [self.navigationController pushViewController:lvc animated:YES];
    }
    else if(indexPath.row == 2){
        BBUIButtonViewController *buvb = [[BBUIButtonViewController alloc]init];
        [self.navigationController pushViewController:buvb animated:YES];
    }
    else if(indexPath.row == 3){
        BBUIAlertViewController *buavc = [[BBUIAlertViewController alloc]init];
        [self.navigationController pushViewController:buavc animated:YES];
    }
    else if(indexPath.row == 4){
        BBUITextFieldViewController *butfcv = [[BBUITextFieldViewController alloc]init];
        [self.navigationController pushViewController:butfcv animated:YES];
    }
    else if(indexPath.row == 5){
        BBUITextViewController *butvc = [[BBUITextViewController alloc]init];
        [self.navigationController pushViewController:butvc animated:YES];
    }
}


/*
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 return 44.0f;
 }
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
