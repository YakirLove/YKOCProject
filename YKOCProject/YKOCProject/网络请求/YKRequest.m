//
//  YKRequest.m
//  YKOCProject
//
//  Created by wyj on 2017/10/16.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKRequest.h"
#import <AFNetworking.h>
#import "AFJSONResponseSerializer+Categary.h"
#import "YKLoadingManager.h"

@interface YKRequest()
{
    AFHTTPSessionManager *manager;
}

@end

@implementation YKRequest

-(AFHTTPSessionManager *)manager
{
    if(!manager)
    {
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    }
    return manager;
}

//设置头部信息
-(void)setHttpHeader:(NSMutableURLRequest *)request
{
    
}

-(NSNumber *)requestData:(YKRequestData *)data method:(YKRequestType)method success:(RequestCallback)success failure:(RequestCallback)fail;
{
    NSString *methodString = @"GET";
    if(method == YKRequestTypePost)
    {
        methodString = @"POST";
    }
    
    AFHTTPRequestSerializer *requestSer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *request = [requestSer requestWithMethod:methodString URLString:[NSString stringWithFormat:@"http://172.16.25.33:8888/PhpResponse/%@.php",data.interfacesCode] parameters:data.requestDic error:NULL];
    
    [self setHttpHeader:request];
    
    if(data.loadingView != nil && [data.loadingView isKindOfClass:[UIView class]])
    {
        [[YKLoadingManager sharedInstance] showLoadingView:data.loadingView];
    }
    
    __block NSURLSessionDataTask *task = nil;
    task = [self.manager dataTaskWithRequest:request
                           completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
    {
        NSNumber *requestID = @([task taskIdentifier]);
        NSData *responseData = responseObject;
        
        if (!error) {
            YKResponseData *response = [[YKResponseData alloc] initWithData:data requestId:[requestID integerValue] responseData:responseData];
            success?success(response):nil;
        }
        else
        {
            if(error.code != NSURLErrorCancelled)//自动取消的请求不返回
            {
                NSLog(@"请求取消");
                YKResponseData *response = [[YKResponseData alloc] initWithData:data requestId:[requestID integerValue] responseData:responseData errData:error];
                fail?fail(response):nil;
            }
        }
        
        [[YKLoadingManager sharedInstance] hiddenLoadingView:data.loadingView];
    }];
    _dataTask = task;
    [task resume];
    NSNumber *requestID = @([task taskIdentifier]);
    return requestID;
}




@end
