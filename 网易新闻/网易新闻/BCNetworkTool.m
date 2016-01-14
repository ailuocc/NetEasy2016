//
//  BCNetworkTool.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCNetworkTool.h"

@implementation BCNetworkTool

+(instancetype)shareNetworkTool{
    static BCNetworkTool* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15.0;
        instance = [[self alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    });
    return instance;

}

@end
