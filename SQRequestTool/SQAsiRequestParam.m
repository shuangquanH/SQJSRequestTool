//
//  SQAsiRequestParam.m
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "SQAsiRequestParam.h"
#import "SQBaseAsiRequestModel.h"
#import<CommonCrypto/CommonDigest.h>
#import "SQHTTPSessionManager.h"



@implementation SQAsiRequestParam

//拼接url
+ (NSString *)requestUrlWithApi:(NSString *)api {
    return [[SQHTTPSessionManager sharedRequestManager].apiUrl stringByAppendingString:api];
}

//处理请求参数
+ (NSDictionary *)requestUrlWithParam:(NSDictionary *)param {
    
    SQBaseAsiRequestModel   *model = [SQBaseAsiRequestModel sharedRequestModel];
    NSMutableDictionary *mutaParam = [NSMutableDictionary dictionaryWithDictionary:param];
    [mutaParam setValue:model.apiVersion forKey:@"apiVersion"];
    [mutaParam setValue:model.apiTime forKey:@"apiTime"];
    [mutaParam setValue:model.appId forKey:@"appId"];
    [mutaParam setValue:model.udid forKey:@"udid"];
    [mutaParam setValue:model.userId forKey:@"userId"];
    [mutaParam setValue:model.osType forKey:@"osType"];
    
    
    NSString    *signStr = [self produceSignatureWithDic:mutaParam];
    
    [mutaParam setValue:signStr forKey:@"signature"];
    [mutaParam setValue:model.appKey forKey:@"appKey"];
    return mutaParam;
}

//生成签名字符串
+ (NSString *)produceSignatureWithDic:(NSDictionary *)dic {
    NSString    *signStr = [NSString string];
    NSArray *keyArr = dic.allKeys;
    NSArray *sorArr = [keyArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    for (int i = 0; i<sorArr.count; i++) {
        NSString    *sortkey = sorArr[i];
        NSString    *sortValue = dic[sortkey];
        if ([sortValue isKindOfClass:[NSArray class]]) {
            if (![self isBlankString:sortValue]) {
                NSString *appendStr = [NSString stringWithFormat:@"%@=%@&", sortkey, sortValue];
                signStr = [signStr stringByAppendingString:appendStr];
            }
        }
    }
    
    NSString *appSecretStr = [NSString stringWithFormat:@"appSecret=%@%@", KAPI_APP_SECRET, KAPI_MD5_YAN];
    signStr = [signStr stringByAppendingString:appSecretStr];
    return [self md5:signStr];
}


//判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)aStr {
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!aStr.length) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}



//md5加密字符串
+ (NSString *)md5:(NSString *)string{
    //小写
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//+ (NSString *)md5:(NSString *)string{
//    const char *cStr = [string UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//
//    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
//
//    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
//        [result appendFormat:@"%02X", digest[i]];
//    }
//    return result;
//}



@end
