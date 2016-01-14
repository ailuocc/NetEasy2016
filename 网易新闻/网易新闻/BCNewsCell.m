//
//  BCNewsCell.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCNewsCell.h"
#import "BCNews.h"
#import <UIImageView+WebCache.h>
@interface BCNewsCell ()


@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *replyCount;
@property (nonatomic, weak) IBOutlet UILabel *digest;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextra;

@end

@implementation BCNewsCell

- (void)setNewsModel:(BCNews *)newsModel{
    _newsModel = newsModel;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageLowPriority];
    self.title.text = newsModel.title;
    self.replyCount.text = [NSString stringWithFormat:@"%@人跟帖",newsModel.replyCount];
    self.digest.text = newsModel.digest;
    
    // 多图数组存在
    if (newsModel.imgextra) {
        [newsModel.imgextra enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            // 设置imgView的图片
            [self.imgextra[idx] sd_setImageWithURL:[NSURL URLWithString:obj[@"imgsrc"]] placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageLowPriority];
        }];
    }
    
}


@end
