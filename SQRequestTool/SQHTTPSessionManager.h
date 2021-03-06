//
//  SQHTTPSessionManager.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "AFNetworking.h"

@interface SQHTTPSessionManager : AFHTTPSessionManager

@property (nonatomic, assign)   NSInteger       eclipseType;
@property (nonatomic, copy)     NSString            *apiUrl;

+ (SQHTTPSessionManager *)sharedRequestManager;

+ (void)startMonitoring;

@end
