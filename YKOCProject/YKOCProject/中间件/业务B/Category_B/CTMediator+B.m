//
//  CTMediator+B.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CTMediator+B.h"

@implementation CTMediator (B)

- (UIViewController *)bViewController
{
    return [self performTarget:@"B" action:@"bViewController" params:nil shouldCacheTarget:NO];
}

@end
