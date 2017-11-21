//
//  YKRequestData.m
//  YKOCProject
//
//  Created by wyj on 2017/10/20.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKRequestData.h"

@implementation YKRequestData

+(YKRequestData *)initRequestData:(NSString *)code parameters:(NSDictionary *)dic;
{
    YKRequestData *data = [[YKRequestData alloc] init];
    data.interfacesCode = code;
    data.requestDic = dic;
    return data;
}


@end
