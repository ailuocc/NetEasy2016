//
//  BCChannelLable.m
//  网易新闻
//
//  Created by Mac－C on 16/1/14.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCChannelLable.h"

@implementation BCChannelLable

#define MaxSize 18
#define MinSize 14


+ (instancetype)lableWithTitle:(NSString *)title{

    BCChannelLable *tLable = [[self alloc] init];

    tLable.text = title;
    // 给个初始大小 让其字体变小时 Lable的Frame也不会变
    tLable.font = [UIFont systemFontOfSize:MaxSize];
    
    [tLable sizeToFit];
    
    tLable.font = [UIFont systemFontOfSize:MinSize];
    
    return tLable;

}

@end
