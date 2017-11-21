//
//  YKRequestManager.h
//  YKOCProject
//
//  Created by wyj on 2017/10/16.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKRequest.h"
#import <UIKit/UIKit.h>

static NSString * const kRequestManagerCode = @"kRequestManagerCode";
static NSString * const kRequestManagerMessage = @"kRequestManagerMessage";

typedef NS_ENUM (NSUInteger, YKRequestCallBackType){
    YKRequestCallBackTypeBlock = 0,
    YKRequestCallBackTypeDelegate
};

typedef NS_ENUM (NSInteger, YKReachabilityStatus) {
    YKReachabilityStatusNotReachable        = 0,
    YKReachabilityStatusReachableViaWWAN    = 1,
    YKReachabilityStatusReachableViaWiFi    = 2,
};

@class YKRequestManager;

@protocol YKRequestManagerDelegate <NSObject>

- (void)requestCallback:(YKRequest *)manager didSuccess:(YKResponseData *)data;
- (void)requestCallback:(YKRequest *)manager didFail:(YKResponseData *)data;

@end

@protocol YKRequestManagerDataSource <NSObject>
@end

@interface YKRequestManager : NSObject

@property (nonatomic, assign) YKRequestCallBackType type;
@property (nonatomic, assign) id <YKRequestManagerDelegate> delegate;
@property (nonatomic, assign) id reformParams;
@property (nonatomic, strong) YKRequest *request;
@property (nonatomic, copy, readonly) NSMutableDictionary <NSNumber *, YKRequest *> *requestSenderDic;
@property (nonatomic, assign, readonly) YKReachabilityStatus reachabilityStatus;

+ (YKRequestManager *)sharedInstance;

- (NSNumber *)sendRequestData:(YKRequestData *)requestData didCallback:(void (^)(YKResponseData *))responseData;

- (void)cancelRequestWithRequestID:(NSNumber *)requestID;

@end
