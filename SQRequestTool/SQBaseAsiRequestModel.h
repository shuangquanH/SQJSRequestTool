//
//  SQBaseAsiRequestModel.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//  公共请求参数

#import <Foundation/Foundation.h>

@interface SQBaseAsiRequestModel : NSObject

@property (nonatomic, copy) NSString    *apiVersion;
@property (nonatomic, copy) NSString    *apiTime;
@property (nonatomic, copy) NSString    *appId;
@property (nonatomic, copy) NSString    *appKey;
@property (nonatomic, copy) NSString    *udid;
@property (nonatomic, copy) NSString    *osType;
@property (nonatomic, copy) NSString    *userId;
@property (nonatomic, copy) NSString    *signature;


+ (SQBaseAsiRequestModel *)sharedRequestModel;

@end
