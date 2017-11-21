//
//  CViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *navHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    navHeaderView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navHeaderView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [navHeaderView addSubview:lineView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, [UIScreen mainScreen].bounds.size.width-100, 44)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"C";
    [navHeaderView addSubview:titleLabel];
    
    [self performSelector:@selector(sendRequest:) withObject:nil afterDelay:1];
    
}

-(void)sendRequest:(id)sender
{
    YKRequestData *data = [YKRequestData initRequestData:@"post" parameters:@{@"data":@"1234"}];
    data.loadingView = self.view;
    
    [[YKRequestManager sharedInstance] sendRequestData:data didCallback:^(YKResponseData *responseData) {
        NSLog(@"one - %@",responseData.responseDic);
        
        YKRequestData *data = [YKRequestData initRequestData:@"FriendList" parameters:nil];
        data.loadingView = self.view;
        
        [[YKRequestManager sharedInstance] sendRequestData:data didCallback:^(YKResponseData *responseData) {
            NSLog(@"two - %@",responseData.responseDic);
        }];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
