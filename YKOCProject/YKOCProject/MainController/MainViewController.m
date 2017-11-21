//
//  MainViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/10.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "MainViewController.h"
#import "TabBarView.h"
#import <Masonry.h>
#import "CTMediator+A.h"
#import "CTMediator+B.h"
#import "CTMediator+C.h"
#import "CTMediator+D.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface MainViewController ()<TabBarViewDelegate>
{
}

@property (nonatomic, strong) TabBarView *tabbarView;

@property (nonatomic, strong) UIViewController *aVC;
@property (nonatomic, strong) UIViewController *bVC;
@property (nonatomic, strong) UIViewController *cVC;
@property (nonatomic, strong) UIViewController *dVC;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.tabbarView];
    [self.view addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-48);
    }];
    
    [self.tabbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@48);
    }];
    
    [self tabbarIndex:0];
}

#pragma mark - getter
-(UIView *)contentView
{
    if(!_contentView)
    {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

-(TabBarView *)tabbarView
{
    if(!_tabbarView)
    {
        _tabbarView = [[TabBarView alloc] init];
        _tabbarView.backgroundColor = [UIColor redColor];
        _tabbarView.delegate = self;
    }
    return _tabbarView;
}

-(UIViewController *)aVC
{
    if(!_aVC)
    {
        _aVC = [[CTMediator sharedInstance] aViewController];
        [self addChildViewController:self.aVC];
    }
    return _aVC;
}

-(UIViewController *)bVC
{
    if(!_bVC)
    {
        _bVC = [[CTMediator sharedInstance] bViewController];
        [self addChildViewController:self.bVC];
    }
    return _bVC;
}

-(UIViewController *)cVC
{
    if(!_cVC)
    {
        _cVC = [[CTMediator sharedInstance] cViewController];
        [self addChildViewController:self.cVC];
    }
    return _cVC;
}

-(UIViewController *)dVC
{
    if(!_dVC)
    {
        _dVC = [[CTMediator sharedInstance] dViewController];
        [self addChildViewController:self.dVC];
    }
    return _dVC;
}

#pragma mark - TabBarViewDelegate 点击跳转

-(void)tabbarIndex:(NSInteger)index
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if(index == 0)
    {
        [self.contentView addSubview:self.aVC.view];
        [self.aVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-48);
        }];
    }
    else if(index == 1)
    {
        [self.contentView addSubview:self.bVC.view];
        [self.bVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-48);
        }];
    }
    else if(index == 2)
    {
        [self.contentView addSubview:self.cVC.view];
        [self.cVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-48);
        }];
    }
    else if(index == 3)
    {
        [self.contentView addSubview:self.dVC.view];
        [self.dVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-48);
        }];
    }
}
#pragma mark -

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
