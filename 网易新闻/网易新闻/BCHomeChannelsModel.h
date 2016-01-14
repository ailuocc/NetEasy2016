//
//  BCHomeChannelsModel.h
//  网易新闻
//
//  Created by Mac－C on 16/1/14.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCHomeChannelsModel : NSObject
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;



+ (instancetype)channelWithDict:(NSDictionary *)dict;

+ (NSArray *)Channels;

@end
