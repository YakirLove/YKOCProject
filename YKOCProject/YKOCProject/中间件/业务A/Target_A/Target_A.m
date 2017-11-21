//
//  Target_A.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "Target_A.h"
#import "AViewController.h"

@implementation Target_A

- (UIViewController *)action_aViewController:(NSDictionary *)params;
{
    AViewController *controller = [[AViewController alloc] init];
    return controller;
}

@end
