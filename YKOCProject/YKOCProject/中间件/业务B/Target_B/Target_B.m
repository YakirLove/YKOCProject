//
//  Target_B.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "Target_B.h"
#import "BViewController.h"

@implementation Target_B

- (UIViewController *)action_bViewController:(NSDictionary *)params;
{
    BViewController *controller = [[BViewController alloc] init];
    return controller;
}

@end
