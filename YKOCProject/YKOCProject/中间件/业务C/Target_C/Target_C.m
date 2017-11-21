//
//  Target_C.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "Target_C.h"
#import "CViewController.h"

@implementation Target_C

- (UIViewController *)action_cViewController:(NSDictionary *)params;
{
    CViewController *controller = [[CViewController alloc] init];
    return controller;
}

@end
