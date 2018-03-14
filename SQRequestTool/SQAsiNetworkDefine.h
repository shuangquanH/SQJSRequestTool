//
//  SQAsiNetworkDefine.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#ifndef SQAsiNetworkDefine_h
#define SQAsiNetworkDefine_h

//接口地址
#define KAPI_ADDRESS @"http://111.231.75.58:8090"
//#define KAPI_ADDRESS @"http://192.168.3.12"



//appId
#define KAPP_ID @"10010"
//apiVersion
#define KAPI_VERSION @"v1.0.0"
//OSTYPE
#define KOS_TYPE @"IOS"
//appKey
#define KAPP_KEY @"ios05100100820180305"
//appSecret签名使用
#define KAPP_SECRET @"e1c0c60c248848f4a9dc29b773ffa463"

//md5加密加盐
#define KMD5_YAN @"10"



//存储userid值的key
#define K_USER_ID @"kUserDefaultUserId"
//keychain值《保证是同一个证书创建的app,开启keychain sharing，设置以下key值》
#define K_KEYCHAINACCESSGROUP @"com.janesi.keychaingroup"
//存储udid值的key
#define K_UDID @"kKeychainKeyForUdid"



//是否需要https(0/1)
#define SQAsi_API_HTTPS 0

 //网络请求超时的时间
#define SQAsi_API_TIME_OUT 15


//请求成功的回调
typedef void (^SQAsiSuccessBlock)(id resultData);

//请求失败的回调,返回错误码 以及错误信息
typedef void (^SQAsiFailureBlock)(NSString *errcode, NSString *errmsg);


#endif /* SQAsiNetworkDefine_h */
