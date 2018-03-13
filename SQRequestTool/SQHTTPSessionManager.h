//
//  SQHTTPSessionManager.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "AFNetworking.h"

@interface SQHTTPSessionManager : AFHTTPSessionManager

+ (AFHTTPSessionManager *)sharedRequestManager;

+ (void)startMonitoring;

@end
