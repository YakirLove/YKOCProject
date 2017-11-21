//
//  YKLoadingManager.h
//  YKOCProject
//
//  Created by wyj on 2017/11/9.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int YKLoadingView_key;

@interface YKLoadingManager : NSObject

+ (YKLoadingManager *)sharedInstance;

-(void)showLoadingView:(UIView *)superView;

-(void)hiddenLoadingView:(UIView *)superView;

@end
