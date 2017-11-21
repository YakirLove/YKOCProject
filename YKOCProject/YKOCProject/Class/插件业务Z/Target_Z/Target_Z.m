//
//  Target_Z.m
//  YKOCProject
//
//  Created by wyj on 2017/10/11.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "Target_Z.h"
#import "ZViewController.h"

@implementation Target_Z

- (UIViewController *)action_zViewController:(NSDictionary *)params;
{
    ZViewController *controller = [[ZViewController alloc] initWithText:params[@"title"]];
    return controller;
}

@end
