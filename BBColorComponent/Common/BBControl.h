//
//  BBControl.h
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BBControl : NSObject
+ (void)checkSubviews:(UIView *)view remove:(BOOL)remove;
+ (void)getViewList;
+ (void)autoChangeStart;
+ (void)stop;
+ (void)changeColor:(BOOL)keyChange;
+ (void)setNewColor:(id)delegate;
+ (void)removeNoUseViews:(UIViewController *)delegate;
@end