//
//  BCNetworkTool.h
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>


@interface BCNetworkTool : AFHTTPSessionManager

+(instancetype)shareNetworkTool;

@end
