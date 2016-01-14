//
//  BCNews.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCNews.h"
#import "BCNetworkTool.h"

@implementation BCNews

+ (instancetype)newWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

/**
 *  返回模型数组
 *
 */
+(void )newWithSuccess:(void(^)(NSArray *news))success error:(void(^)(NSError *error))error{
    // 加载数据 返回一个字典 NSDictionary * responseObject 第一个key中是一个数组
    [[BCNetworkTool shareNetworkTool]GET:@"article/headline/T1348647853363/0-20.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        // 获得字典数组
        NSArray *newsArr = responseObject[@"T1348647853363"];
        NSMutableArray *tempNews = [NSMutableArray array];
        // 数组中的字典再转成模型
        for (NSDictionary *dict in newsArr) {
            BCNews *model =  [self newWithDict:dict];
            [tempNews addObject:model];
        }
        
        success(tempNews.copy);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        error(err);
    }];
  
}

- (NSString *)IDentifiler{
    if (self.imgextra) {
        return @"imgCell";
    }else if(self.imgType){
    return @"bigCell";
    
    }
    else{
        return @"News";
    
    }

}

@end
