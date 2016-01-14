//
//  HeadLineModel.h
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadLineModel : NSObject


//     imgsrc = "http://img5.cache.netease.com/3g/2016/1/13/20160113093238ec64a.jpg";
//     subtitle = "";
//     tag = photoset;
//     title = "\U5317\U4eac\U8b66\U65b9\U591c\U67e5\U9ed1\U8db3\U7597\U5e97 \U6253\U6389\U9ec4\U8d4c\U56e2\U4f19";
//     url = "54GI0096|86271";

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)headLineWithDict:(NSDictionary *)dict;


+(void )headLinesWithSuccess:(void(^)(NSArray *headLines))success error:(void(^)(NSError *error))error;

@end
