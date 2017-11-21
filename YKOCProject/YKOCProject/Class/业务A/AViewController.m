//
//  AViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "AViewController.h"
#import "CTMediator+Z.h"
#import "UIViewExt.h"
#import "YKRequest.h"

@interface AViewController ()
{
    YKRequest *request;
}
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"A";
//    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [button setTitle:@"业务Z" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(zTouch:) forControlEvents:UIControlEventTouchUpInside];
    
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
    titleLabel.text = @"A";
    [navHeaderView addSubview:titleLabel];
    
//    YKRequestData *data = [YKRequestData initRequestData:@"FriendList" parameters:nil];
//
//    [[YKRequestManager sharedInstance] sendRequestData:data didCallback:^(YKResponseData *responseData) {
//        NSLog(@"%@",responseData.responseDic);
//    }];
    
    
}

-(void)zTouch:(UIButton *)button
{
    UIViewController *vc = [[CTMediator sharedInstance] zController:@"业务Z"];
    UIViewController *con = (UIViewController *)self.view.superview.nextResponder;
    [con.navigationController pushViewController:vc animated:YES];
//    [[UIViewController(self.view.superview.nextResponder) navigationController] pushViewController:vc animated:YES];
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
