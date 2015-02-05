//
//  BBColor.h
//  BBColorComponent
//
//  Created by Jihoon Lee on 2014. 11. 7..
//  Copyright (c) 2014년 yahoai. All rights reserved.
//


#import "BB.h"

@interface BBColor : NSObject
+ (float)getColorKey;
+ (void)setColorKey;
+ (UIColor *)getColor:(BBColorType)type;
+ (void)setColor:(BBColorCombination)key;
+ (void)setUserDefault:(NSString *)key value:(NSString *)value;
+ (id)getUserDefault:(NSString *)key;
@end

