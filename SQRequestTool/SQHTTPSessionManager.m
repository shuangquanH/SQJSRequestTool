//
//  SQHTTPSessionManager.m
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "SQHTTPSessionManager.h"
#import "SQAsiNetworkDefine.h"

@implementation SQHTTPSessionManager

static SQHTTPSessionManager *manager;
+ (SQHTTPSessionManager *)sharedRequestManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //网络请求单例
        manager = [SQHTTPSessionManager manager];
        
        //设置超时时间
        manager.requestSerializer.timeoutInterval = SQAsi_API_TIME_OUT;
        
        //请求参数格式
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //响应数据格式
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        // 缓存策略(禁止缓存,获取新数据)
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        //https配置文件,暂时先不用
        if (SQAsi_API_HTTPS) {
            [manager setSecurityPolicy:[self SQSecurityPolicy]];            
        }
        
    });
    return manager;
}

//网络监测
+ (void)startMonitoring
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络");
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                
                break;
        }
    }];
    [mgr startMonitoring];
}


// https ssl 验证函数
+ (AFSecurityPolicy *)SQSecurityPolicy{
    // 先导入证书证书由服务端生成，具体由服务端人员操作
    NSString *cerPath = [[NSBundle mainBundle]pathForResource:@"214275058990899" ofType:@"cer"];//证书的路径
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES;
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = [[NSSet alloc]initWithObjects:cerData, nil];
    
    return securityPolicy;
}

@end
