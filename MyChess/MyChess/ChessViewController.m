//
//  ChessViewController.m
//  MyChess
//
//  Created by student on 15-1-28.
//  Copyright (c) 2015年 赵旭. All rights reserved.
//

#import "ChessViewController.h"

@interface ChessViewController ()

@end

@implementation ChessViewController
{
//    这个变量指向的永远是被选中的棋子
    UIButton *_currentBtn;
//    显示用户相关操作的文本框
    UILabel *_tipLabel;
}

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
	// Do any additional setup after loading the view.
//    viewcontroller 启动之后， 就会进入这个方法， 我们习惯上在本方法中进行各种调用， 而不是写各种界面
//    要记住方法调用
//    添加题目
    [self addChessTitle];
//    添加棋盘
    [self addChessBoard];
//    添加用户相关操作的标签
    [self addTipLabel];
//    添加被选择用户的状态的标签
//    [self showSelectedStatus:sender];
    [self addGameControlBtns];
    
}

//添加重置按钮 重置/开始/暂停
- (void)addGameControlBtns
{
//    添加重置按钮
    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    添加按钮名字 重置游戏 默认状态的名字 如果不设置其他情况下的名字 那么四种状态下的名字都和默认是一样的
    [resetBtn setTitle:@"重置游戏" forState:UIControlStateNormal];
//    设置按钮的位置 大小
    resetBtn.frame = CGRectMake(20, 450, 80, 30);
    [resetBtn addTarget:self action:@selector(click_reset) forControlEvents:UIControlEventTouchUpInside];
    resetBtn.backgroundColor = [UIColor orangeColor];
//    添加红色阴影
    [resetBtn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    阴影位移 titleLabel 调整按钮的文字相关的内容 但是注意不能改文字 因为按钮的文字要分四种状态
    resetBtn.titleLabel.shadowOffset = CGSizeMake(2, 2);
//    改变文字大小
    resetBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:resetBtn];
//    添加开始
    UIButton *beginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [beginBtn setTitle:@"开始游戏" forState:UIControlStateNormal];
    beginBtn.frame = CGRectMake(120, 450, 80, 30);
    [beginBtn addTarget:self action:@selector(click_begin) forControlEvents:UIControlEventTouchUpInside];
    beginBtn.backgroundColor = [UIColor orangeColor];
    [beginBtn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    beginBtn.titleLabel.shadowOffset = CGSizeMake(2, 2);
    beginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
//    设置点击 按钮中间发亮提示
    beginBtn.showsTouchWhenHighlighted = YES;
    [self.view addSubview:beginBtn];
//    添加暂停
    UIButton *pauseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pauseBtn setTitle:@"游戏暂停" forState:UIControlStateNormal];
    pauseBtn.frame = CGRectMake(220, 450, 80, 30);
    [pauseBtn addTarget:self action:@selector(click_pause) forControlEvents:UIControlEventTouchUpInside];
    pauseBtn.backgroundColor = [UIColor orangeColor];
    [pauseBtn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pauseBtn setTitleShadowColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [pauseBtn setReversesTitleShadowWhenHighlighted:YES];
    pauseBtn.titleLabel.shadowOffset = CGSizeMake(3, 3);
    pauseBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:pauseBtn];
    
}

- (void)click_begin
{
    //    提示标签改为 游戏已开始  棋盘不可点击
    _tipLabel.text = @"游戏已开始";
    //    棋盘不可点击
    UIView *boardView = [self.view viewWithTag:2222];
    boardView.userInteractionEnabled = YES;
    
    if (_currentBtn) {
        NSMutableString * str = [NSMutableString new];
        if (_currentBtn.tag == 1000) {
            [str appendString:@"红方选择了"];
        } else if (_currentBtn.tag == 2000) {
            [str appendString:@"蓝方选择了"];
        }
        [str appendString:_currentBtn.currentAttributedTitle.string];
        _tipLabel.text = str;
    }

}

//暂停游戏
- (void)click_pause
{
//    提示标签改为 游戏已暂停  棋盘不可点击
    _tipLabel.text = @"游戏已暂停";
//    棋盘不可点击
    UIView *boardView = [self.view viewWithTag:2222];
    boardView.userInteractionEnabled = NO;
}

//点击重置按钮执行重置操作：棋盘所有棋子归位 当前棋子设为空 提示标签改为原始状态
//由于点击重置按钮之后 不需要对重置按钮进行属性上得操作 所以可以不用传值进来
- (void)click_reset
{
//    重置提示标签
    _tipLabel.text = @"欢迎来到国际象棋";
//    设置当前棋子的变量 指针为空
    _currentBtn = nil;
//    重置棋盘 让所有棋子归位
//    通过tag值 来取到boardView  也就是棋盘的容器
    UIView *boardView = [self.view viewWithTag:2222];
//    棋盘的容器 从他的 父view中移除
    [boardView removeFromSuperview];
//    重新添加
    [self addChessBoard];
}

//添加用户相关操作的提示标签
- (void)addTipLabel
{
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 30)];
    _tipLabel.textAlignment = NSTextAlignmentCenter;//居中
    _tipLabel.font = [UIFont systemFontOfSize:18];//字体大小
    _tipLabel.textColor = [UIColor greenColor];//文字颜色
    _tipLabel.backgroundColor = [UIColor purpleColor];
    _tipLabel.text = @"欢迎来到国际象棋";
    [self.view addSubview:_tipLabel];
}

//添加棋盘
- (void)addChessBoard
{
//    创建一个view作为容器  容器里面装棋盘和所有的棋子  当移除操作的时候 直接把容器删除就可以了
    UIView *boardView = [[UIView alloc] initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.width)];
    boardView.tag = 2222;
    [self.view addSubview:boardView];
    
    
//      设置背景颜色
    self.view.backgroundColor = [UIColor lightGrayColor];
//    为了方便循环中设置按钮的文字，所以使用数组
    NSArray *arr = @[@"车", @"马", @"象", @"王", @"后", @"象", @"马", @"车"];
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
//        C - core核心  G - graphic 图像
            CGFloat width = self.view.frame.size.width / 8;
//            为了不把title遮住，所以需要在Y轴添加75像素高度
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(width * j, i * width, width, width)];
//            [self.view addSubview:v];
            [boardView addSubview:v];
//            添加棋子(按钮)
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = v.frame;
            
//            给棋子添加点击事件
//            target 将要执行的方法 所属的对象
//            action 点击后 执行的方法
//            event 触发事件的操作类型
            [btn addTarget:self action:@selector(click_btn:) forControlEvents:UIControlEventTouchUpInside];
            
            [boardView addSubview:btn];
            
//            注意 v 和 btn 反了的话，会出现覆盖的问题
            
//            if (i == 0 || i == 7) {
////                设置第0行和第7行， 按钮的名字
////                [btn setTitle:arr[j] forState:UIControlStateNormal];
//                NSAttributedString * attrStr = [[NSAttributedString alloc] initWithString:arr[j] attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
//                [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
//            }
//            设置第1行和第6行 按钮的名字
            if (i == 1 || i == 6) {
//                [btn setTitle:@"🚲" forState:UIControlStateNormal];
                NSAttributedString * attrstr = [[NSAttributedString alloc] initWithString:@"兵" attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
                [btn setAttributedTitle:attrstr forState:UIControlStateNormal];
            }
//            设置颜色
//            if (i == 0 || i == 1) {
//                [btn setTintColor:[UIColor redColor]];
//            }
//            if (i == 6 || i == 7) {
//                [btn setTintColor:[UIColor purpleColor]];
//            }
            
            
//            把第零行文字设置为红色粗体
            if (i == 0) {
                NSAttributedString * attrStr = [[NSAttributedString alloc] initWithString:arr[j] attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: [UIColor redColor]}];
                [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
//                我定义 1000 这个数 代表红色方   2000 这个数 代表蓝色方
//                tag值 属于uiview  通常用来区分不同view  tag值可以是重复的
                btn.tag = 1000;
            }
//            把第七行文字 设置为蓝色
            if (i == 7) {
                NSAttributedString * attrStr = [[NSAttributedString alloc] initWithString:arr[j] attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: [UIColor purpleColor]}];
                [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
                btn.tag = 2000;
            }
//            把第一行设置为 红色 粗体
            if (i == 1) {
                NSAttributedString * attrStr = [[NSAttributedString alloc] initWithString:@"兵" attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: [UIColor redColor]}];
                [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
                btn.tag = 1000;
            }
//            把第六行设置为 蓝色 粗体
            if (i == 6) {
                NSAttributedString * attrStr = [[NSAttributedString alloc] initWithString:@"兵" attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: [UIColor purpleColor]}];
                [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
                btn.tag = 2000;
            }

            
//            设置黑白相间棋盘
            if ((i + j) % 2 == 0) {
                v.backgroundColor = [UIColor blackColor];
            } else {
                v.backgroundColor = [UIColor whiteColor];
            }
        }
    }
}

//棋子的点击事件
- (void)click_btn:(UIButton *)sender
{
//    第一次点击一个棋子的时候，棋子为选中状态
//    当有棋子是选中状态时， 再次点击， 则进行互换操作(针对与第二次点击的是空白的区域)
    if (_currentBtn) {
        
//        吃兵
//        如果两次点击的棋子是一种颜色  就不做任何操作
        if (_currentBtn.tag == sender.tag) {
//            当第二次点击同一个势力的棋子  那么进行选择棋子的变换
//            前两步换颜色
            _currentBtn.backgroundColor = [UIColor clearColor];
            sender.backgroundColor = [UIColor orangeColor];
//            切换近期点击Btn的指针
            _currentBtn = sender;
            
            return;
        } else {
            if (sender.currentAttributedTitle) {
//                如果存在 说明是吃
                NSMutableString *str = [NSMutableString new];
                if (_currentBtn.tag == 1000) {
                    //                红
                    [str appendString:@"红方吃掉了蓝方的"];
                }
                
                if (_currentBtn.tag == 2000) {
                    //                蓝
                    [str appendString:@"蓝方吃掉了红方的"];
                }
                
                [str appendString:sender.currentAttributedTitle.string];
                _tipLabel.text = str;
                //            [str appendString:@"吃掉了"];
            } else {
//                如果不存在 说明是移动
                NSMutableString *str = [NSMutableString new];
                if (_currentBtn.tag == 1000) {
                    //                红
                    [str appendString:@"红方移动了"];
                }
                
                if (_currentBtn.tag == 2000) {
                    //                蓝
                    [str appendString:@"蓝方移动了"];
                }
                
                [str appendString:_currentBtn.currentAttributedTitle.string];
                _tipLabel.text = str;
                //            [str appendString:@"吃掉了"];
            }
//            题目设置为空 吃掉的感觉
            [sender setAttributedTitle:nil forState:UIControlStateNormal];
//            被吃掉的 改一下tag值 不是1000 不是2000 都行
            sender.tag = 3000;
            
        }
        
//        说明currentBtn不为空 说明已经选中棋子 将要进行的是替换操作
//        先保存第二次点击的按钮位置
        CGRect rect = sender.frame;
        
        sender.frame = _currentBtn.frame;
        
        _currentBtn.frame = rect;
        
//        注意，互换操作完成之后 按钮被放置到了棋盘格子View的下方
//        学习把一个图层 view 按钮 放置到self.view这个容器的最上方，
//        bring 把 subview 子view front  前方
//        bringSubviewToFront: 就是把容器中的一个视图放到最上方
        UIView * boardView = [self.view viewWithTag:2222];
        [boardView bringSubviewToFront:_currentBtn];
        [boardView bringSubviewToFront:sender];
        
//        当互换位置操作结束以后 要把currentBtn指向空 重新回到未选择时的状态
//        互换之后   把颜色调回透明
        _currentBtn.backgroundColor = [UIColor clearColor];
        _currentBtn = nil;
        
        
        
    } else {
//        如果点选的按钮题目是空 那么什么都不做
        if (!sender.currentAttributedTitle) {
            return;
        }
        
//        说明currentBtn为空 说明还没有选中棋子 那么currentBtn的指针应该指向被选中的棋子
        _currentBtn = sender;
        
//        选中的时候给个背景色
        _currentBtn.backgroundColor = [UIColor orangeColor];
        
        [self showSelectedStatus:sender];
        
//        添加提示
//        红方 选择了 象 可复用
//        NSMutableString *str = [NSMutableString new];
//        if (sender.tag == 1000) {
////            红方
//            [str appendString:@"红方"];
//        }
//        
//        if (sender.tag == 2000) {
//            [str appendString:@"蓝方"];
//        }
//        
//        [str appendString:@"选择了"];
//        
//        [str appendString:sender.currentAttributedTitle.string];
//        
//        _tipLabel.text = str;
        
    }
    
}

//显示被选择的状态
- (void)showSelectedStatus:(UIButton *)sender
{
    NSMutableString *str = [NSMutableString new];
    if (sender.tag == 1000) {
        //            红方
        [str appendString:@"红方"];
    }
    
    if (sender.tag == 2000) {
        [str appendString:@"蓝方"];
    }
    
    [str appendString:@"选择了"];
    
    [str appendString:sender.currentAttributedTitle.string];
    
    _tipLabel.text = str;
    
}

// 添加我的象棋 题目
- (void)addChessTitle
{
//    初始化label, 宽度为屏幕宽度 这样方便设置 文字居中
    UILabel * titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width, 30)];
//    设置标签文字是“我的象棋”
//    titlelabel.text = @"我的象棋";
//    设置居中
    titlelabel.textAlignment = NSTextAlignmentCenter;
//    文字变大，粗体 bold粗体
    titlelabel.font = [UIFont boldSystemFontOfSize:25];
//    我要设置每个文字颜色都不同， 需要用 带属性的 字符串
//    Mutable可变的 Attribute 属性
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"我的象棋"];
//    添加第一个属性 改变 “我” 为红色
//    NSForegroundColorAttributeName 表示前台显示的颜色
//    改变字体颜色和大小
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:23] range:NSMakeRange(0, 1)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(1, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(1, 1)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(2, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:NSMakeRange(2, 1)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(3, 1)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:NSMakeRange(3, 1)];
    //改变字体背景颜色
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, 4)];
//    崩溃原因  bounds -- 超限  NSMakeRange 注意下取值
    titlelabel.attributedText = str;
    
    [self.view addSubview:titlelabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
