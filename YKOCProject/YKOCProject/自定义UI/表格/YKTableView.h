//
//  YKTableView.h
//  YKOCProject
//
//  Created by wyj on 2017/11/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

@class YKTableView;

@protocol YKTableViewDelegate

@optional
/**
 *  下拉事件
 *  @param tableView 表格
 */
-(void)pullDown:(YKTableView *)tableView;

/**
 *  上拉事件
 *  @param tableView 表格
 */
-(void)pullUp:(YKTableView *)tableView;

@end

@interface YKTableView : UITableView

@property(nonatomic, assign) BOOL enableMore; ///< 启用/禁用上拉更多

@property(nonatomic, assign) BOOL enableRefresh; ///< 启用/禁用下拉刷新

@property(nonatomic) Class headerClass;

@property(nonatomic) Class footerClass;

@property(nonatomic, assign) id<YKTableViewDelegate> pullDelegate; ///< 事件委托

/**
 *  进入刷新状态
 */
- (void)beginRefreshing;
/**
 *  结束刷新状态
 */
- (void)endRefreshing;
/**
 *  是否正在刷新
 *
 *  @return 是否正在刷新
 */
- (BOOL)isRefreshing;
/**
 *  进入加载更多状态
 */
- (void)beginLoadMore;
/**
 *  结束加载更多状态
 */
- (void)endLoadMore;
/**
 *  是否正在加载更多
 *
 *  @return 是否正在刷新
 */
- (BOOL)isLoadingMore;
/**
 *  提示没有更多的数据
 */
- (void)noticeNoMoreData;
/**
 *  重置没有更多的数据（消除没有更多数据的状态）
 */
- (void)resetNoMoreData;

@end

