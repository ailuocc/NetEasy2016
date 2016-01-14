//
//  BCNews.h
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 postid	:	PHOT39LH000100AP
 
 hasCover	:	false
 
 hasHead	:	1
 
 replyCount	:	8753
 
 hasImg	:	1
 
 digest	:
 
 hasIcon	:	true
 
 docid	:	9IG74V5H00963VRO_BD7L7609liziweiupdateDoc
 
 title	:	市场遭强拆货物被埋 拾荒者闻讯运货
 
 order	:	1
 
 priority	:	253
 
 lmodify	:	2016-01-13 16:15:02
 
 boardid	:	photoview_bbs
 
	ads		[5]
 
 photosetID	:	00AP0001|108209
 
 template	:	manual
 
 votecount	:	7474
 
 skipID	:	00AP0001|108209
 
 alias	:	Top News
 
 skipType	:	photoset
 
 cid	:	C1348646712614
 
 hasAD	:	1
 
	imgextra		[2]
 
 imgsrc	:	http://img2.cache.netease.com/3g/2016/1/13/20160113161644c485d.jpg
 
 tname	:	头条
 
 ename	:	iosnews
 
 ptime	:	2016-01-13 16:15:02
 
 imgextra(数组)

 
 
 */

@interface BCNews : NSObject

@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *replyCount;
// 摘要
@property (nonatomic, copy) NSString *digest;

/**
 *  多图数组
 */
@property (nonatomic, strong) NSArray *imgextra;
@property (nonatomic, assign) BOOL imgType;



+ (instancetype)newWithDict:(NSDictionary *)dict;

+(void )newWithSuccess:(void(^)(NSArray *news))success error:(void(^)(NSError *error))error;


- (NSString *)IDentifiler;

@end
