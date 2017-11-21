//
//  Target_D.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "Target_D.h"
#import "DViewController.h"
@implementation Target_D

- (UIViewController *)action_dViewController:(NSDictionary *)params;
{
    DViewController *controller = [[DViewController alloc] init];
    return controller;
}

@end
