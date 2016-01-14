//
//  HeadLineModel.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "HeadLineModel.h"
#import "BCNetworkTool.h"

@implementation HeadLineModel

+ (instancetype)headLineWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(void )headLinesWithSuccess:(void(^)(NSArray *headLines))success error:(void(^)(NSError *error))error{
    // 加载数据 返回一个字典 NSDictionary * responseObject 第一个key中是一个数组
    [[BCNetworkTool shareNetworkTool]GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        // 获得字典数组
        NSArray *headLines = responseObject[@"headline_ad"];
        NSMutableArray *tempHeadLines = [NSMutableArray array];
        // 数组中的字典再转成模型
        for (NSDictionary *dict in headLines) {
           HeadLineModel *model =  [self headLineWithDict:dict];
            [tempHeadLines addObject:model];
        }
        
        success(tempHeadLines.copy);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        error(err);
    }];



}

@end
