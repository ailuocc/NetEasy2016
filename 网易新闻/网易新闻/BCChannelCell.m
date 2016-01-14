//
//  BCChannelCell.m
//  网易新闻
//
//  Created by Mac－C on 16/1/14.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCChannelCell.h"
#import "BCHomeController.h"
#import "NewsViewController.h"

@interface BCChannelCell ()

@property (nonatomic, strong) NewsViewController *newsVC;

@end

@implementation BCChannelCell


- (void)awakeFromNib{
    // 从SB加载控制器
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsVC =[sb instantiateInitialViewController];
    
    // 把控制器的View添加到cell上
    [self addSubview:self.newsVC.view];


}

- (void)layoutSubviews{

    self.newsVC.view .frame = self.bounds;

}

@end
