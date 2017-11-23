//
//  CViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "CViewController.h"
#import "YKNoDataViewManager.h"
@interface CViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) UITableView *dTableView;
@end

@implementation CViewController

-(UITableView *)dTableView
{
    if(!_dTableView)
    {
        _dTableView = [[UITableView alloc] init];
        _dTableView.delegate = self;
        _dTableView.dataSource = self;
//        _dTableView.footerClass = [YKDIYAutoFooter class];
//        _dTableView.headerClass = [YKDIYHeader class];
//        _dTableView.pullDelegate = self;
//        _dTableView.enableMore = YES;
//        _dTableView.enableRefresh = YES;
        
    }
    return _dTableView;
}

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
    
    dataArray = [[NSMutableArray alloc] init];
}

-(void)sendRequest:(id)sender
{
    YKRequestData *data = [YKRequestData initRequestData:@"FriendList" parameters:@{@"name":@"Yakir"}];
    data.loadingView = self.view;
    
    [[YKRequestManager sharedInstance] sendRequestData:data didCallback:^(YKResponseData *responseData) {
        NSLog(@"%@",responseData.responseDic);
        NSMutableArray *array = [responseData.responseDic objectForKey:@"data"];
        if(array.count == 0)
        {
            NSLog(@"没有数据");
            [self.dTableView removeFromSuperview];
            [[YKNoDataViewManager sharedInstance] showNoDataView:self.view reloadData:^{
                [self sendRequest:nil];
            }];
        }
        else
        {
            NSLog(@"有数据");
            [self.view addSubview:self.dTableView];
            
            [self.dTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view).offset(64);
                make.left.mas_equalTo(self.view);
                make.right.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.view);
            }];
            
            [dataArray addObjectsFromArray:array];
            [self.dTableView reloadData];
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    else
    {
        for(UIView *tView in cell.contentView.subviews)
        {
            [tView removeFromSuperview];
        }
    }
    
    NSDictionary *dic = dataArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",dic[@"name"]];
    
    return cell;
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
