//
//  CTMediator+D.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CTMediator+D.h"

@implementation CTMediator (D)

- (UIViewController *)dViewController
{
    return [self performTarget:@"D" action:@"dViewController" params:nil shouldCacheTarget:NO];
}

@end
