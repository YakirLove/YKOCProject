//
//  BZViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/20.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "BZViewController.h"

@interface BZViewController ()
{
    NSNumber *number;
}
@end

@implementation BZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YKRequestData *data = [YKRequestData initRequestData:@"FriendList" parameters:nil];
    number = [[YKRequestManager sharedInstance] sendRequestData:data didCallback:^(YKResponseData *responseData) {
        NSLog(@"%@",responseData.responseDic);
    }];
}

-(void)dealloc
{
    [[YKRequestManager sharedInstance] cancelRequestWithRequestID:number];
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
