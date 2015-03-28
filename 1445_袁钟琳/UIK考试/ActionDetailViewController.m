//
//  ActionDetailViewController.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ActionDetailViewController.h"
#import "UIKit+AFNetworking.h"
#import "ActionModel.h"

@interface ActionDetailViewController ()

@property (nonatomic, strong) UIView *myView;


@end

@implementation ActionDetailViewController

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
    
    self.title = @"活动详情";
    
    NSLog(@"%@", _model.actimg);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addImageView];
    
    [self addButton];
    
    [self addView];
    
    [self addDatas];
	// Do any additional setup after loading the view.
}

- (void)addImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, 320, 150)];
    
    
    [imageView setImageWithURL:[NSURL URLWithString:_model.actimg]];
    
    [self.view addSubview:imageView];
    
}

- (void)addButton {
    
    NSArray *tempArr = @[@"活动简介", @"获奖名单", @"马上参与"];
    
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        btn.frame = CGRectMake(i * 110, 211, 105, 30);
        
        btn.backgroundColor = [UIColor orangeColor];
        
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitle:tempArr[i] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
    }
    
}

- (void)addView {
    _myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 243, 320, 190)];
    
    
    _myView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_myView];
    
}

- (void)addDatas {
    NSString *acttitle = [NSString stringWithFormat:@"活动标题:%@", _model.acttitle];
    
    UILabel *acttitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    acttitleLabel.font = [UIFont systemFontOfSize:13];
    
    acttitleLabel.text = acttitle;
    
    [_myView addSubview:acttitleLabel];
    
    NSString *time = [NSString stringWithFormat:@"参与人数:%@", _model.actpeoplenum];
    
    UILabel *actpeoplenum = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 30)];
    actpeoplenum.text = time;
    
    actpeoplenum.font = [UIFont systemFontOfSize:13];
    
    [_myView addSubview:actpeoplenum];
    
    NSString *actstarttime = [NSString stringWithFormat:@"开始时间:%@", _model.actstarttime];
    
    UILabel *actstarttimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 320, 30)];
    
    actstarttimeLabel.text = actstarttime;
    
    actstarttimeLabel.font = [UIFont systemFontOfSize:13];
    
    [_myView addSubview:actstarttimeLabel];
    
    NSString *actpubdate = [NSString stringWithFormat:@"结束时间:%@", _model.actpubdate];
    
    UILabel *actpubdateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 320, 30)];
    
    actpubdateLabel.font = [UIFont systemFontOfSize:13];
    
    actpubdateLabel.text = actpubdate;
    
    [_myView addSubview:actpubdateLabel];
    
    NSString *acttopeople = [NSString stringWithFormat:@"参与对象:%@", _model.acttopeople];
    
    UILabel *acttopeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 53, 320, 50)];
    
    acttopeopleLabel.font = [UIFont systemFontOfSize:13];
    
    acttopeopleLabel.numberOfLines = 0;
    
    acttopeopleLabel.text = acttopeople;
    
    [_myView addSubview:acttopeopleLabel];
    
    NSString *actmemo = [NSString stringWithFormat:@"活动内容:%@", _model.actmemo];
    
    UILabel *actmemoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 320, 100)];
    
    actmemoLabel.font = [UIFont systemFontOfSize:13];
    
    actmemoLabel.numberOfLines = 0;
    
    actmemoLabel.text = actmemo;
    
    [_myView addSubview:actmemoLabel];
    
}

- (void)click:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"活动简介"]) {
        [self addDatas];
        
        _myView.hidden = NO;
        
    } else {
        _myView.hidden = YES;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
