//
//  Cell.m
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 24..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize title,subTitle;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        BBUIView *backgroundView = [BBComponent makeView:(CGRect){0,0,[BBComponent getsSreenWidth],65} backgroundColor:COLOR_000000 BBColorType:BBColorBackground];
        
        title = [BBComponent makeLabel:(CGRect){10,15,[BBComponent getsSreenWidth]-20,17} backgroundColor:COLOR_FFFFFF text:@"" textColor:COLOR_000000 textAlign:NSTextAlignmentLeft font:DEFAULT_FONT_17 BBColorType:BBColorTitleText];
        
        subTitle = [BBComponent makeLabel:(CGRect){10,title.frame.origin.y+title.frame.size.height+5 ,[BBComponent getsSreenWidth]-20,12} backgroundColor:COLOR_FFFFFF text:@"" textColor:COLOR_000000 textAlign:NSTextAlignmentLeft font:DEFAULT_FONT_12 BBColorType:BBColorNormalText];
        
        [self addSubview:backgroundView];
        [self addSubview:title];
        [self addSubview:subTitle];
    }
    
    return  self;
}

@end
