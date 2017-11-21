//
//  ZViewController.m
//  YKOCProject
//
//  Created by wyj on 2017/10/11.
//  Copyright © 2017年 wyj. All rights reserved.
//

#import "ZViewController.h"

@interface ZViewController ()

@property (nonatomic ,copy) NSString *textString;

@end

@implementation ZViewController

-(id)initWithText:(NSString *)string;
{
    self = [super init];
    if(self)
    {
        _textString = string;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _textString;
    self.view.backgroundColor = [UIColor whiteColor];
    
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
