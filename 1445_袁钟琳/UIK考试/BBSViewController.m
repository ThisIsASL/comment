//
//  BBSViewController.m
//  UI考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BBSViewController.h"
#import "AFNetworking.h"
#import "BBSModel.h"
#import "BBSCell.h"
#import "DetailViewController.h"

@interface BBSViewController () <UITableViewDelegate, UITableViewDataSource>

//@property(nonatomic, assign) int pid;

@property(nonatomic, strong) NSMutableArray *datas;//保存所有数据
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation BBSViewController

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
    
    self.navigationItem.title = @"D1CM论坛";
    
    //初始化datas
    _datas = [NSMutableArray array];
    
    [self downloadData];
    
    

    
    //创建表
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
	// Do any additional setup after loading the view.
}

- (void)downloadData
{
    NSString *path = @"http://api.d1cm.com/appbbs/getforum.action?pid=1";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"string:%@",string);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        NSArray *array = dic[@"info"];

        for (NSDictionary *tempDic in array) {
            
            BBSModel *model = [BBSModel modelWithDic:tempDic];
            
            [_datas addObject:model];
        }
        //刷新表
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BBSCell *cell = [BBSCell cellWithTableView:tableView];
    
    BBSModel *model = _datas[indexPath.row];
    
    cell.myModel = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail = [[DetailViewController alloc] init];
    
    detail.BBSModel = _datas[indexPath.row];
    
    //当前界面是什么,就把什么传给detail界面
    detail.proTitle = self.title;
    
    [self.navigationController pushViewController:detail animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
