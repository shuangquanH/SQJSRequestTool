//
//  SQBaseAsiResponseModel.h
//  Podtest
//
//  Created by Fly on 2018/3/5.
//  Copyright © 2018年 Fly. All rights reserved.
//  公共返回参数

#import <Foundation/Foundation.h>

@interface SQBaseAsiResponseModel : NSObject

@property (nonatomic, copy) NSString    *accessToken;
@property (nonatomic, copy) NSString    *code;
@property (nonatomic, copy) NSString    *msg;
@property (nonatomic, copy) NSString    *result;
@property (nonatomic, copy) NSString    *isPaging;
@property (nonatomic, copy) NSString    *pageSize;
@property (nonatomic, copy) NSString    *totalSize;
@property (nonatomic, copy) NSString    *pageNo;
@property (nonatomic, copy) NSString    *totalPage;



@end
