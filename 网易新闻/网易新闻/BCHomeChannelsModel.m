//
//  BCHomeChannelsModel.m
//  网易新闻
//
//  Created by Mac－C on 16/1/14.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCHomeChannelsModel.h"

@implementation BCHomeChannelsModel
+ (instancetype)channelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(NSArray *)Channels{
    NSString *dataPath= [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    NSDictionary *channelsDict=  [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *channelArray = channelsDict[@"tList"];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    [channelArray enumerateObjectsUsingBlock:^(NSDictionary  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BCHomeChannelsModel *model = [BCHomeChannelsModel channelWithDict:obj];
        [tempArray addObject:model];
    }];
    
    return [tempArray sortedArrayUsingComparator:^NSComparisonResult(BCHomeChannelsModel  *obj1, BCHomeChannelsModel  * obj2) {
       return  [obj1.tid compare:obj2.tid];
    }];

}

@end
