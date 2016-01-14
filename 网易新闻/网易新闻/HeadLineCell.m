//
//  HeadLineCell.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "HeadLineCell.h"
#import <UIImageView+WebCache.h>
#import "HeadLineModel.h"

@interface HeadLineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation HeadLineCell

- (void)setModel:(HeadLineModel *)model{

    _model = model;
    
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageLowPriority];

}

@end
