//
//  CTMediator+Z.m
//  YKOCProject
//
//  Created by wyj on 2017/10/11.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CTMediator+Z.h"

@implementation CTMediator (Z)

-(UIViewController *)zController:(NSString *)title
{
    return [self performTarget:@"Z" action:@"zViewController" params:@{@"title":title} shouldCacheTarget:NO];
}

@end
