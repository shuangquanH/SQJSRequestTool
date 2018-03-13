//
//  SQRequest.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//  网络请求工具类

#import <Foundation/Foundation.h>
#import "SQAsiNetworkDefine.h"

@interface SQRequest : NSObject



//GET请求,只处理成功回调
+ (void)getRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result;

//POST请求,只处理成功回调
+ (void)postRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result;



//GET请求,带失败回调处理
+ (void)getRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result failure:(SQAsiFailureBlock)failure;

//POST请求,带失败回调处理
+ (void)postRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result failure:(SQAsiFailureBlock)failure;

@end
