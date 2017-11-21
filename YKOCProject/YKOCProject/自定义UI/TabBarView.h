//
//  TabBarView.h
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabBarViewDelegate <NSObject>

-(void)tabbarIndex:(NSInteger)index;

@end

@interface TabBarView : UIView
{
    NSMutableArray *array;
}

@property (nonatomic, assign) id <TabBarViewDelegate> delegate;

@end
