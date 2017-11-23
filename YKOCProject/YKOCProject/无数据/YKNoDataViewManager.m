//
//  YKNoDataView.m
//  YKOCProject
//
//  Created by wyj on 2017/11/21.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKNoDataViewManager.h"

@interface YKNoDataViewManager()
{
    NoDataCallback reloadCallback;
}
@end


@implementation YKNoDataViewManager

+ (YKNoDataViewManager *)sharedInstance
{
    static dispatch_once_t once;
    static YKNoDataViewManager *sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[YKNoDataViewManager alloc] init];
    });
    return sharedInstance;
}

- (UIView *)createNoDataView:(UIView *)superView
{
    UIView *noDataView = [[UIView alloc] initWithFrame:superView.frame];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, (noDataView.frame.size.height-60)/2.0, noDataView.frame.size.width, 60)];
    label.textColor = [UIColor redColor];
    label.text = @"没有数据，点击刷新";
    label.textAlignment = NSTextAlignmentCenter;
    [noDataView addSubview:label];
    
    [noDataView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction:)]];
    
    return noDataView;
}

-(void)touchAction:(id)sender
{
    reloadCallback();
    UIView *noDataView = [sender view];
    [noDataView removeFromSuperview];
    noDataView = nil;
}

-(void)showNoDataView:(UIView *)superView reloadData:(void (^)(void))callback
{
    UIView *noDataView = [self createNoDataView:superView];
    [superView addSubview:noDataView];
    reloadCallback = callback;
}

@end
