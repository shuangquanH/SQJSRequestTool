//
//  SQRequest.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//  网络请求工具类

#import <Foundation/Foundation.h>
#import "SQAsiNetworkDefine.h"

typedef enum : NSUInteger {
    //生产环境地址
    PRODUCT = 0,
    //预发环境地址
    PREPARE = 1,
    //测试环境接口地址
    TEST = 2,
    //开发环境地址
    DEVELOP = 3,
} EclipseType;


@interface SQRequest : NSObject

/** 设置环境,建议在appdelegate初始化的时候设置一次 */
+ (void)setEclipse:(EclipseType)type;

/** 设置自定义环境地址(只在非生产环境有效) */
+ (void)setCustomAddress:(NSString  *)addres;



//GET请求,只处理成功回调
+ (void)getRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result;

//POST请求,只处理成功回调
+ (void)postRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result;



//GET请求,带失败回调处理
+ (void)getRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result failure:(SQAsiFailureBlock)failure;

//POST请求,带失败回调处理
+ (void)postRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result failure:(SQAsiFailureBlock)failure;

@end
