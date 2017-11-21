//
//  YKTableView.m
//  YKOCProject
//
//  Created by wyj on 2017/11/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKTableView.h"
#import "YKDIYAutoFooter.h"

@interface YKTableView()

@end

@implementation YKTableView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self loadDefault];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDefault];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    //frame.size.width = [UIScreen mainScreen].bounds.size.width;
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self loadDefault];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadDefault];
    }
    return self;
}

-(void)loadDefault
{
    _headerClass = [MJRefreshHeader class];
    _footerClass = [MJRefreshAutoFooter class];
}

-(void)setFooterClass:(Class)class
{
    if([class isSubclassOfClass:[MJRefreshAutoFooter class]])
    {
        _footerClass = class;
    }
    else
    {
        @throw [NSException exceptionWithName:@"异常" reason:@"tableview footer类型错误" userInfo:nil];
    }
}

-(void)setHeaderClass:(Class)class
{
    if([class isSubclassOfClass:[MJRefreshHeader class]])
    {
        _headerClass = class;
    }
    else
    {
        @throw [NSException exceptionWithName:@"异常" reason:@"tableview header类型错误" userInfo:nil];
    }
}

#pragma mark 启用/禁用下拉刷新
-(void)setEnableRefresh:(BOOL)enable
{
    if (_enableRefresh == enable)
    {
        return;
    }
    
    _enableRefresh = enable;
    
    if (_enableRefresh)
    {
        self.mj_header = [_headerClass headerWithRefreshingBlock:^{
            //防止上拉下载同时刷新
            if (self.isLoadingMore == NO)
            {
                if([(NSObject *)self.pullDelegate respondsToSelector:@selector(pullDown:)])
                {
                    [self.pullDelegate pullDown:self];
                }
            }
            else
            {
                [self endRefreshing];
            }
        }];
    }
    else
    {
        self.mj_header = nil;
    }
}

#pragma mark 启用/禁用上拉更多
-(void)setEnableMore:(BOOL)enable
{
    if (_enableMore == enable) {
        return;
    }

    _enableMore = enable;
    
    if (_enableMore) {
        self.mj_footer = [_footerClass footerWithRefreshingBlock:^{
            //防止上拉下载同时刷新
            if (self.isRefreshing == NO ) {
                if([(NSObject *)self.pullDelegate respondsToSelector:@selector(pullUp:)]){
                    [self.pullDelegate pullUp:self];
                }
            }
            else{
                [self endLoadMore];
            }
        }];
    }else{
        self.mj_footer = nil;
    }
}

#pragma mark 提示没有更多的数据
- (void)noticeNoMoreData
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark 重置没有更多的数据（消除没有更多数据的状态）
- (void)resetNoMoreData
{
    [self.mj_footer resetNoMoreData];
}

#pragma mark 进入刷新状态
- (void)beginRefreshing
{
    [self.mj_header beginRefreshing];
}

#pragma mark 结束刷新状态
- (void)endRefreshing
{
    [self.mj_header endRefreshing];
}

#pragma mark 是否正在刷新
- (BOOL)isRefreshing
{
    return [self.mj_header isRefreshing];
}

#pragma mark 进入加载更多状态
- (void)beginLoadMore
{
    [self.mj_footer beginRefreshing];
}

#pragma mark 结束加载更多状态
- (void)endLoadMore
{
    [self.mj_footer endRefreshing];
}

#pragma mark 是否正在加载更多
- (BOOL)isLoadingMore
{
    return [self.mj_footer isRefreshing];
}

@end
