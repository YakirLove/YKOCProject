//
//  YKDIYHeader.m
//  YKOCProject
//
//  Created by wyj on 2017/11/20.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKDIYHeader.h"
#import "POP.h"
#import "TableFooterView.h"

@interface YKDIYHeader()
{
    TableFooterView *footView;
    UIActivityIndicatorView *actView;
}
@end


@implementation YKDIYHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 40;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
}

-(TableFooterView *)footView
{
    if(!footView)
    {
        footView = [[TableFooterView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        footView.backgroundColor = [UIColor clearColor];
    }
    return footView;
}

-(UIActivityIndicatorView *)actView
{
    if(!actView)
    {
        actView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        actView.frame = CGRectMake((self.frame.size.width-20)/2.0, (self.frame.size.height-20)/2.0, 20, 20);
//        actView.backgroundColor = [UIColor redColor];
        [actView startAnimating];
    }
    return actView;
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            
            [self.actView removeFromSuperview];
            [self addSubview:self.footView];
            
            break;
        case MJRefreshStatePulling:
            
            [self.actView removeFromSuperview];
            [self addSubview:self.footView];
            
            break;
        case MJRefreshStateRefreshing:
            
            [self.footView removeFromSuperview];
            [self addSubview:self.actView];
            
            break;
        case MJRefreshStateNoMoreData:
            
            [self.actView removeFromSuperview];
            [self.footView removeFromSuperview];
            
            break;
        default:
            break;
    }
}


-(void)clearFooter
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
