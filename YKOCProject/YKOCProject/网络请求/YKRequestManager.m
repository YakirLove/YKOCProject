//
//  YKRequestManager.m
//  YKOCProject
//
//  Created by wyj on 2017/10/16.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKRequestManager.h"
#import "AFNetworkReachabilityManager.h"

@interface YKRequestManager()

@property (nonatomic, copy, readwrite) NSMutableDictionary <NSNumber *, YKRequest *> *requestSenderDic;
@property (nonatomic, assign, readwrite) YKReachabilityStatus reachabilityStatus;

@end

@implementation YKRequestManager

@synthesize requestSenderDic;

+ (YKRequestManager *)sharedInstance
{
    static dispatch_once_t pred;
    static YKRequestManager *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[YKRequestManager alloc] init];
    });
    return sharedInstance;
}

- (NSMutableDictionary *)requestSenderDic
{
    if (requestSenderDic == nil) {
        requestSenderDic = [[NSMutableDictionary alloc] init];
    }
    return requestSenderDic;
}

///发送请求前处理是否可以发送 错误或者违法请求 可以剔除掉
-(BOOL)requestCanBeginSend:(YKRequestData *)requestData
{
    return YES;
}

///接收的成功请求回调 可针对处理某个请求
-(void)requestDidEndRespondSuccess:(YKResponseData *)responseData
{
    
}

///接收的失败请求回调 可针对处理某个错误code
-(void)requestDidEndRespondFail:(YKResponseData *)responseData
{
    if([[responseData.responseDic objectForKey:@"code"] integerValue] == 999)
    {
        //发生需要重新登录的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReLogin" object:nil];
    }
}

- (NSNumber *)sendRequestData:(YKRequestData *)requestData didCallback:(void (^)(YKResponseData *))responseData;
{
    if([self requestCanBeginSend:requestData])
    {
        YKRequest *request = [[YKRequest alloc] init];
        NSNumber *num = [request requestData:requestData method:YKRequestTypePost success:^(YKResponseData *data) {
            [self requestDidEndRespondSuccess:data];
            responseData(data);
        } failure:^(YKResponseData *data) {
            [self requestDidEndRespondFail:data];
            responseData(data);
        }];
        [self.requestSenderDic setObject:request forKey:num];
        return num;
    }
    return @(0);
}

- (void)cancelRequestWithRequestID:(NSNumber *)requestID
{
    YKRequest *requestOperation = self.requestSenderDic[requestID];
    [requestOperation.dataTask cancel];
    [self.requestSenderDic removeObjectForKey:requestID];
}

- (void)cancelRequestWithRequestIDList:(NSArray *)requestIDList
{
    for (NSNumber *requestId in requestIDList) {
        [self cancelRequestWithRequestID:requestId];
    }
}

-(YKReachabilityStatus)reachabilityStatus
{
    if([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] == AFNetworkReachabilityStatusReachableViaWWAN)
    {
        return YKReachabilityStatusReachableViaWiFi;
    }
    else if([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] == AFNetworkReachabilityStatusReachableViaWiFi)
    {
        return YKReachabilityStatusReachableViaWWAN;
    }
    else
    {
        return YKReachabilityStatusNotReachable;
    }
    
    return YKReachabilityStatusNotReachable;
}

@end
