//
//  SQBaseAsiRequestModel.m
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "SQBaseAsiRequestModel.h"
#import "SQAsiNetworkDefine.h"
#import "YKeychain.h"

@implementation SQBaseAsiRequestModel


static SQBaseAsiRequestModel *model;
+ (SQBaseAsiRequestModel *)sharedRequestModel {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[SQBaseAsiRequestModel alloc] init];
        model.apiVersion = KAPI_VERSION;
        model.appId = KAPI_APP_ID;
        model.appKey = KAPI_APP_KEY;
        model.osType = KAPI_OS_TYPE;
    });
    return model;
}

- (NSString *)udid {
    NSString *saved = [YKeychain valueForKey:K_UDID forAccessGroup:K_KEYCHAINACCESSGROUP];
    if (saved) {
        return saved;
    } else {
        NSString    *theUDID = [[NSUUID UUID] UUIDString];
        [YKeychain setValue:theUDID forKey:K_UDID forAccessGroup:K_KEYCHAINACCESSGROUP];
        return theUDID;
    }
}

- (NSString *)apiTime {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    return timeString;
}

- (NSString *)userId {
    NSString *saveId = [[NSUserDefaults standardUserDefaults] objectForKey:K_USER_ID];
    if (saveId) {
        return saveId;
    } else {
        return @"";
    }
}





@end
