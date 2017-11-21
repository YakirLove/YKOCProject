//
//  YKRequestData.h
//  YKOCProject
//
//  Created by wyj on 2017/10/20.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YKRequestData : NSObject

@property (nonatomic, copy) NSString *interfacesCode;   ///< 接口号
@property (nonatomic, copy) NSDictionary *requestDic;   ///< 请求参数
@property (nonatomic ,strong) UIView *loadingView;      ///< 需要显示的接口的请求
@property (nonatomic ,assign) BOOL needCache;           ///< 缓存这个接口数据

+(YKRequestData *)initRequestData:(NSString *)code parameters:(NSDictionary *)dic;

@end
