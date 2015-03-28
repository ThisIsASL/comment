//
//  ActionViewController.m
//  UI考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ActionViewController.h"
#import "AFNetworking.h"
#import "ActionModel.h"
#import "ActionCell.h"
#import "ActionDetailViewController.h"

@interface ActionViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *datas;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ActionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"D1CM活动";
    
    _datas = [NSMutableArray array];
    
    [self downloadData];
    
    //创建表
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _datas = [NSMutableArray array];
    
    [self.view addSubview:_tableView];
    
	// Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActionCell *cell = [ActionCell cellWithTableView:tableView];
    
    ActionModel *model = _datas[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (void)downloadData
{
    _urlString = @"http://api.d1cm.com/appact/hotact.action?page=1";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:_urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"%@", string);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *tempArr = dic[@"info"];
        
        NSLog(@"%@", tempArr);
        
        for (NSDictionary *dic in tempArr) {
            
            ActionModel *model = [ActionModel modelWithDic:dic];
            
            [_datas addObject:model];
        }
        
        //刷新表
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"失败");
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActionDetailViewController *detail = [[ActionDetailViewController alloc] init];
    
    detail.model = _datas[indexPath.row];
    
    
    [self.navigationController pushViewController:detail animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
