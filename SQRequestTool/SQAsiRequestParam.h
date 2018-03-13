//
//  SQAsiRequestParam.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//  请求参数处理以及返回数据处理

#import <Foundation/Foundation.h>
#import "SQAsiNetworkDefine.h"

@interface SQAsiRequestParam : NSObject

//拼接url
+ (NSString *)requestUrlWithApi:(NSString *)api;

//处理参数
+ (NSDictionary *)requestUrlWithParam:(NSDictionary *)param;


@end
