//
//  YKNoDataViewManager.h
//  YKOCProject
//
//  Created by wyj on 2017/11/21.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NoDataCallback)(void);

@interface YKNoDataViewManager : NSObject

+ (YKNoDataViewManager *)sharedInstance;

-(void)showNoDataView:(UIView *)superView reloadData:(NoDataCallback)callback;



@end
