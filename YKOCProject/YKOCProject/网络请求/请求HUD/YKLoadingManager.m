//
//  YKLoadingManager.m
//  YKOCProject
//
//  Created by wyj on 2017/11/9.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "YKLoadingManager.h"
#import <objc/runtime.h>
@interface YKLoadingManager()
{
    
}
@property (nonatomic, copy) NSMutableDictionary *loadingViewDic;
@property (nonatomic, assign) NSInteger tag;
@end

@implementation YKLoadingManager

+ (YKLoadingManager *)sharedInstance
{
    static dispatch_once_t once;
    static YKLoadingManager *sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[YKLoadingManager alloc] init];
        sharedInstance.tag = 1;
    });
    return sharedInstance;
}

- (UIView *)createLoadingView:(UIView *)superView
{
    UIView *loadingView = [[UIView alloc] initWithFrame:superView.frame];
    
    UIView *bgView = [[UIView alloc] initWithFrame:loadingView.frame];
    bgView.backgroundColor = [UIColor clearColor];
    [superView addSubview:bgView];
    
    UIImageView *rotatingImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 88/2, 109/2)];
    rotatingImg.center = bgView.center;
    rotatingImg.layer.masksToBounds = YES;
    rotatingImg.layer.cornerRadius = 2;
    rotatingImg.image = [UIImage imageNamed:@"加载1.png"];
    rotatingImg.animationImages = @[[UIImage imageNamed:@"加载1.png"],[UIImage imageNamed:@"加载2.png"],[UIImage imageNamed:@"加载3.png"],[UIImage imageNamed:@"加载4.png"]];
    rotatingImg.animationRepeatCount = 0;
    rotatingImg.animationDuration = 0.8;
    [loadingView addSubview:rotatingImg];
    [rotatingImg startAnimating];
    
    return loadingView;
}

-(void)showLoadingView:(UIView *)superView
{
    UIView *loadingView = objc_getAssociatedObject(superView, &YKLoadingView_key);
    if(!loadingView)
    {
        loadingView = [self createLoadingView:superView];
        objc_setAssociatedObject(superView, &YKLoadingView_key, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        loadingView.tag = self.tag++;
    }
    [superView addSubview:loadingView];
    
    [self addLoadCountForKey:[NSString stringWithFormat:@"%ld",(long)loadingView.tag]];
}

-(void)hiddenLoadingView:(UIView *)superView
{
    UIView *loadingView = objc_getAssociatedObject(superView, &YKLoadingView_key);
    BOOL remove = [self releaseLoadCountForKey:[NSString stringWithFormat:@"%ld",(long)loadingView.tag]];
    if(remove)
    {
        [loadingView removeFromSuperview];
    }
}

-(void)addLoadCountForKey:(NSString *)string
{
    if([self.loadingViewDic.allKeys containsObject:string])
    {
        NSString *countString = self.loadingViewDic[string];
        [self.loadingViewDic setValue:[NSString stringWithFormat:@"%ld",(countString.integerValue)+1] forKey:string];
    }
    else
    {
        [self.loadingViewDic setValue:@"1" forKey:string];
    }
}

-(BOOL)releaseLoadCountForKey:(NSString *)string
{
    NSString *countString = self.loadingViewDic[string];
    NSInteger count = countString.integerValue;
    if(count > 1)
    {
        [self.loadingViewDic setValue:[NSString stringWithFormat:@"%ld",count-1] forKey:string];
        return NO;
    }
    else
    {
        [self.loadingViewDic removeObjectForKey:string];
        return YES;
    }
    return YES;
}

-(NSMutableDictionary *)loadingViewDic
{
    if(!_loadingViewDic)
    {
        _loadingViewDic = [[NSMutableDictionary alloc] init];
    }
    return _loadingViewDic;
}

@end
