//
//  YKResponseData.h
//  YKOCProject
//
//  Created by wyj on 2017/10/17.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKRequestData.h"

typedef NS_ENUM(NSUInteger, YKRequestResponseStatus)
{
    YKRequestResponseStatusSuccess,
    YKRequestResponseStatusErrorTimeout,
    YKRequestResponseStatusErrorFail
};

@interface YKResponseData : NSObject

@property (nonatomic, assign, readonly) YKRequestResponseStatus status;///< 数据状态

@property (nonatomic, assign, readonly) NSInteger requestId;///< 请求的id

@property (nonatomic, copy, readonly) NSData *responseData;///< 接收data数据
@property (nonatomic, copy, readonly) NSDictionary *responseDic;  ///< 接收参数

@property (nonatomic, strong, readonly) NSError *error;///< 错误

@property (nonatomic, assign, readonly) BOOL isCache; ///< 是否缓存

@property (nonatomic, assign, readonly) YKRequestData *requestData; /// 请求的数据

-(id)initWithData:(YKRequestData *)request requestId:(NSInteger)rid responseData:(NSData *)data;
-(id)initWithData:(YKRequestData *)request requestId:(NSInteger)rid responseData:(NSData *)data errData:(NSError *)err;

@end

