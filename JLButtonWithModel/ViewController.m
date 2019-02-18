//
//  ViewController.m
//  JLButtonWithModel
//
//  Created by 科盛数聚 on 2019/2/15.
//  Copyright © 2019年 John. All rights reserved.
//

#import "ViewController.h"
#import "JLButtonModel.h"
#import "UIButton+JLModelButton.h"


@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *dataArr;


@end

@implementation ViewController

#pragma mark ---------------- UI搭建 ----------------

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getdata];

    
}

- (void)uiBuild{
    
    for (int i = 0; i < self.dataArr.count; i++) {
        JLButtonModel *model = self.dataArr[i];
        UIButton *btn = [[UIButton alloc] init];
        btn.model = model;
        [self.view addSubview:btn];
        [btn setTitle:model.name forState:UIControlStateNormal];
        btn.frame = CGRectMake(100, 200*i, 100, 50);
        btn.backgroundColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}


#pragma mark ---------------- 业务逻辑 ----------------

#pragma mark ---------------- 按钮点击 ----------------

- (void)didTouchBtn:(UIButton*)sender{
    
    JLButtonModel *model = (JLButtonModel*)sender.model;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"我的价格是%@\n地址是%@",model.price,model.location] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }];

    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    // ios8.0 之前
}

#pragma mark ---------------- 数据处理 ----------------



- (void)getdata{
    
    for (int i = 0; i < 5; i++) {
        JLButtonModel *model = [[JLButtonModel alloc] init];
        model.name = [NSString stringWithFormat:@"我是%d号",i];
        model.price = [NSString stringWithFormat:@"￥%d",i*300];
        model.location = [NSString stringWithFormat:@"东直门50%d号",i];
        
        [self.dataArr addObject:model];
    }
    
    [self uiBuild];
}


- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
