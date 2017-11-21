//
//  YKResponseData.m
//  YKOCProject
//
//  Created by wyj on 2017/10/17.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKResponseData.h"

@implementation YKResponseData

-(id)initWithData:(YKRequestData *)request requestId:(NSInteger)rid responseData:(NSData *)data
{
    self = [super init];
    if(self)
    {
        _status = YKRequestResponseStatusSuccess;
        _requestData = request;
        _requestId = rid;
        _responseData = data;
        _isCache = NO;
        if([data isKindOfClass:[NSDictionary class]])
        {
            _responseDic = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)data];
        }
        else if([data isKindOfClass:[NSData class]])
        {
             _responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        }
    }
    return self;
}


-(id)initWithData:(YKRequestData *)request requestId:(NSInteger)rid responseData:(NSData *)data errData:(NSError *)err;
{
    self = [super init];
    if(self)
    {
        _requestData = request;
        _requestId = rid;
        _responseData = data;
        _isCache = NO;
        _error = err;
        _status = [self responseStatusWithError:err];
    }
    return self;
}

#pragma mark - private methods
- (YKRequestResponseStatus)responseStatusWithError:(NSError *)error
{
    if (error) {
        YKRequestResponseStatus result = YKRequestResponseStatusErrorFail;
        
        // 除了超时以外，所有错误都当成是无网络
        if (error.code == NSURLErrorTimedOut) {
            result = YKRequestResponseStatusErrorTimeout;
        }
        return result;
    } else {
        return YKRequestResponseStatusSuccess;
    }
}

@end
