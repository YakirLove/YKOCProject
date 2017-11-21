//
//  CTMediator+A.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CTMediator+A.h"

@implementation CTMediator (A)

- (UIViewController *)aViewController
{
    return [self performTarget:@"A" action:@"aViewController" params:nil shouldCacheTarget:NO];
}

@end
