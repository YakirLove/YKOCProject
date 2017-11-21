//
//  CTMediator+C.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CTMediator+C.h"

@implementation CTMediator (C)

- (UIViewController *)cViewController
{
    return [self performTarget:@"C" action:@"cViewController" params:nil shouldCacheTarget:NO];
}

@end
