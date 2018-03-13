//
//  SQAsiRequestDispose.m
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//

#import "SQAsiRequestDispose.h"
#import "SVProgressHUD.h"

@implementation SQAsiRequestDispose


+ (void)disposeWithResponseObject:(id)response successBlock:(SQAsiSuccessBlock)succ failureBlock:(SQAsiFailureBlock)failure {
    NSDictionary    *responseDic = [NSDictionary dictionaryWithDictionary:response];
    NSString        *code = [responseDic valueForKey:@"code"];
    NSString        *errmeg = [responseDic valueForKey:@"msg"];
    NSDictionary    *result = [responseDic valueForKey:@"result"];
    
    if ([code isEqualToString:@"0"]) {
        if (succ) {
            succ(result);
        }
        
    } else {
        [SVProgressHUD showErrorWithStatus:errmeg];
        if (failure) {
            failure(code, errmeg);
        }
    }
}


@end
