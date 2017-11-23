//
//  DViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "DViewController.h"
#import "YKTableView.h"
#import "YKDIYAutoFooter.h"
#import "YKDIYHeader.h"


@interface DViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, YKTableViewDelegate>
{
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) YKTableView *dTableView;

@end

@implementation DViewController

-(UITableView *)dTableView
{
    if(!_dTableView)
    {
        _dTableView = [[YKTableView alloc] init];
        _dTableView.delegate = self;
        _dTableView.dataSource = self;
        _dTableView.footerClass = [YKDIYAutoFooter class];
        _dTableView.headerClass = [YKDIYHeader class];
        _dTableView.pullDelegate = self;
        _dTableView.enableMore = YES;
        _dTableView.enableRefresh = YES;
        
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
    titleLabel.text = @"D";
    [navHeaderView addSubview:titleLabel];
    
    dataArray = [[NSMutableArray alloc] init];
    
//    [self sendRequest:nil];
    
    [self.view addSubview:self.dTableView];
    
    [self.dTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(64);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    
    [self pullDown:self.dTableView];
}

-(void)sendRequest:(void (^)(NSMutableArray *array))callback
{
    YKRequestData *data = [YKRequestData initRequestData:@"FriendList" parameters:@{@"name":@"Yakir"}];
    [[YKRequestManager sharedInstance] sendRequestData:data didCallback:^(YKResponseData *responseData) {
//        NSLog(@"two - %@",responseData.responseDic);
        NSMutableArray *array = responseData.responseDic[@"data"];
        callback(array);
    }];
}

-(void)pullUp:(YKTableView *)tableView
{
    [self sendRequest:^(NSMutableArray *array) {
        [dataArray addObjectsFromArray:array];
        if(array.count == 0)
        {
            //没有新数据
        }
        [self.dTableView reloadData];
        [self.dTableView endLoadMore];
    }];
}

-(void)pullDown:(YKTableView *)tableView
{
    [self sendRequest:^(NSMutableArray *array) {
        [dataArray removeAllObjects];
        [dataArray addObjectsFromArray:array];
        if(array.count == 0)
        {
            //没有数据
            
        }
        [self.dTableView reloadData];
        [self.dTableView endRefreshing];
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
