//
//  SQRequest.m
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "SQRequest.h"
#import "SQHTTPSessionManager.h"
#import "SQAsiRequestDispose.h"
#import "SQAsiRequestParam.h"
#import "SVProgressHUD.h"

@implementation SQRequest

+ (void)setEclipse:(EclipseType)type {
    [SQHTTPSessionManager startMonitoring];
    [SQHTTPSessionManager sharedRequestManager].eclipseType = type;
}

//POST请求,带失败回调
+ (void)postRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result failure:(SQAsiFailureBlock)failure {
    AFHTTPSessionManager    *session = [SQHTTPSessionManager sharedRequestManager];
    NSString        *url = [SQAsiRequestParam requestUrlWithApi:api];
    NSDictionary    *param = [SQAsiRequestParam requestUrlWithParam:dic];
    
    [session POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SQAsiRequestDispose disposeWithResponseObject:responseObject successBlock:result failureBlock:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestErrorWithApi:api error:error failureblock:failure];
    }];
}

//GET请求,带失败回调
+ (void)getRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result failure:(SQAsiFailureBlock)failure {
    
    AFHTTPSessionManager    *session = [SQHTTPSessionManager sharedRequestManager];
    NSString        *url = [SQAsiRequestParam requestUrlWithApi:api];
    NSDictionary    *param = [SQAsiRequestParam requestUrlWithParam:dic];
    
    [session GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SQAsiRequestDispose disposeWithResponseObject:responseObject successBlock:result failureBlock:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestErrorWithApi:api error:error failureblock:failure];
    }];
}

//POST请求
+ (void)postRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result {
    [self postRequestWithApi:api param:dic result:result failure:nil];
}

//GET请求
+ (void)getRequestWithApi:(NSString *)api param:(NSDictionary *)dic result:(SQAsiSuccessBlock)result {
    [self getRequestWithApi:api param:dic result:result failure:nil];
}

+ (void)requestErrorWithApi:(NSString *)api error:(NSError *)error failureblock:(SQAsiFailureBlock)failure {
    NSLog(@"api:%@发生错误， 错误原因:%@", api, error);
    if (failure) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络"];
        failure(nil,nil);
    }
}


@end
