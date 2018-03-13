//
//  SQAsiRequestDispose.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQAsiNetworkDefine.h"


@interface SQAsiRequestDispose : NSObject

//处理请求数据的回调方法
+ (void)disposeWithResponseObject:(id)response successBlock:(SQAsiSuccessBlock)succ failureBlock:(SQAsiFailureBlock)failure;

@end
