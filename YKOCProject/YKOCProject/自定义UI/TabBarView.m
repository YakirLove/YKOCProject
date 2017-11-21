//
//  TabBarView.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "TabBarView.h"


@implementation TabBarView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:lineView];
    
    array = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 4; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4*i, 0, [UIScreen mainScreen].bounds.size.width/4, 48)];
        button.tag = i;
        if(i == 0)
        {
            button.backgroundColor = [UIColor redColor];
            [button setTitle:@"A" forState:UIControlStateNormal];
        }
        else if(i == 1)
        {
            button.backgroundColor = [UIColor greenColor];
            [button setTitle:@"B" forState:UIControlStateNormal];
        }
        else if(i == 2)
        {
            button.backgroundColor = [UIColor greenColor];
            [button setTitle:@"C" forState:UIControlStateNormal];
        }
        else if(i == 3)
        {
            button.backgroundColor = [UIColor greenColor];
            [button setTitle:@"D" forState:UIControlStateNormal];
        }
        
        [button addTarget:self action:@selector(selectIndex:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        [array addObject:button];
    }
}

-(void)selectIndex:(UIButton *)button
{
    [array makeObjectsPerformSelector:@selector(setBackgroundColor:) withObject:[UIColor greenColor]];
    button.backgroundColor = [UIColor redColor];
    
    if([self.delegate respondsToSelector:@selector(tabbarIndex:)])
    {
        [self.delegate tabbarIndex:button.tag];
    }
}

@end
