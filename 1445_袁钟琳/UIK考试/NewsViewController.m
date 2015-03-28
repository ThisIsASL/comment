//
//  NewsViewController.m
//  UI考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NewsViewController.h"
#import "AFNetworking.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "ScrollViewModel.h"
#import "UIKit+AFNetworking.h"

@interface NewsViewController ()<UITableViewDataSource, UITableViewDelegate, UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, assign) int page;

@property(nonatomic, strong)NSMutableArray *datas;
@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)NSMutableArray *pictures;
@property (nonatomic, strong) UIPageControl *pageC;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation NewsViewController


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
    
    self.navigationItem.title = @"热门新闻";
    
    //下载数据
    [self downloadData];
    
    _page = 1;
    
    //建表
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _datas = [NSMutableArray array];
    
    [self.view addSubview:_tableView];
    
    _pictures = [NSMutableArray array];
    
    [self scrollViewDownloadData];
    
}

- (void)scrollViewDownloadData
{
    NSString *path = @"http:api.d1cm.com/appadv/advlist.action?advsiteid=10000";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *tempArr = dic[@"info"];
        
        for (NSDictionary *dic in tempArr) {
            ScrollViewModel *model = [ScrollViewModel modelWithDic:dic];
            
            
            [_pictures addObject:model];
        }
        UIScrollView *svc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
        
        for (int i = 0; i < _pictures.count; i++) {
            
            ScrollViewModel *model = _pictures[i];
            
            UIImageView *imageview = [UIImageView new];
            
            [imageview setImageWithURL:[NSURL URLWithString:model.imgsrc]];
            
            imageview.frame = CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, 180);
            
            svc.delegate = self;
            
            [svc addSubview:imageview];
            
        }
        
        svc.bounces = NO;
        
        svc.pagingEnabled = YES;
        
        svc.showsHorizontalScrollIndicator = NO;
        
        svc.contentSize  = CGSizeMake(CGRectGetWidth(self.view.frame) * 2, 180);
        
        self.pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(230, 160, 100, 20)];
        
        self.pageC.numberOfPages = _pictures.count;
        
        self.pageC.currentPageIndicatorTintColor = [UIColor orangeColor];
        
        self.pageC.pageIndicatorTintColor = [UIColor whiteColor];
        
        UIView *v = [UIView new];
        
        v.frame = CGRectMake (0, 66.3, self.view.frame.size.width, 180);
        
        v.backgroundColor = [UIColor clearColor];
        
        [v addSubview:svc];
        
        [v addSubview:_pageC];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake (5, 78, self.view.frame.size.width, 180)];
        
        self.detailLabel.textColor = [UIColor whiteColor];
        
        self.detailLabel.font = [UIFont systemFontOfSize:12];
        
        self.detailLabel.text = @"V”时代 解读现代R350LC-9V型液压挖掘机";
        
        [v addSubview:_detailLabel];
        
        
        _tableView.tableHeaderView = v;
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"下载失败");
        
    }];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    
    CGPoint pt = scrollView.contentOffset;
    
    NSInteger num = pt.x / self.view.frame.size.width;
    
    
    if (num == 1) {
        _detailLabel.text = @"超能陆战队 阿特拉斯·科普柯U6坑道岩心钻机";
    } else {
        _detailLabel.text = @"V”时代 解读现代R350LC-9V型液压挖掘机";
    }
    _pageC.currentPage = num;
}


- (void)downloadData
{
    _urlString = @"http://api.d1cm.com/appnews/daynews.action";
    
    NSString *path = [NSString  stringWithFormat:_urlString,_page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager POST:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
//        NSLog(@"数据格式：%@", string);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dic[@"info"];
        
        for (NSDictionary *tempDic in array) {
            
            NewsModel *model = [NewsModel newsModelWithDic:tempDic];
            
            [_datas addObject:model];
        }
        //刷新表
        [_tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"失败");
        
    }];
}

#pragma mark --- 代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [NewsCell cellWithTableView:tableView];
    
    NewsModel *model = _datas[indexPath.row];
    
    cell.myModel = model;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
