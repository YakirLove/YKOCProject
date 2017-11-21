//
//  YKRequest.h
//  YKOCProject
//
//  Created by wyj on 2017/10/16.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YKResponseData.h"
#import "YKRequestData.h"

typedef void(^RequestCallback)(YKResponseData *responseData);

typedef NS_ENUM (NSUInteger, YKRequestType){
    YKRequestTypeGet,
    YKRequestTypePost
};

@interface YKRequest : NSObject

@property (nonatomic ,strong) NSURLSessionDataTask *dataTask;
@property (nonatomic ,copy) NSString *code;

-(NSNumber *)requestData:(YKRequestData *)data method:(YKRequestType)method success:(RequestCallback)success failure:(RequestCallback)fail;

@end
