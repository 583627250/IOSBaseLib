//
//  BaseViewController.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *backBtn;//返回按钮

@property (nonatomic, strong) UIButton *rightBtn;//右侧的按钮

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorFromHex(@"f5f5f5");
    [self initNavigationView];
    if (IsDeviceSystemOver(7.0))
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;      // 手势有效设置为YES  无效为NO
        self.navigationController.interactivePopGestureRecognizer.delegate = self;    // 手势的代理设置为self
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (IsDeviceSystemOver(7.0))
    {
        if (self.navigationController.viewControllers.count == 1)
        {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
    if (self.navigationController.viewControllers.count == 1){
        self.backBtn.hidden = YES;
    }else{
        self.backBtn.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSLog(@"内存不足:%@",[self class]);
}

- (void)dealloc
{
    NSLog(@"%@ 释放了！！！",[self class]);
}

-(void)initNavigationView{
    
    //隐藏系统导航
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBar.backItem.hidesBackButton = YES;
    [self.navigationController.navigationBar setHidden:YES];
    
    //状态栏背景图片
    self.navigationImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenNavigationBarHeight)];
    self.navigationImgView.userInteractionEnabled = YES;
    self.navigationImgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navigationImgView];
    
    if (IsPhoneX) {
        self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, ScreenWidth, ScreenNavigationBarHeight - 44)];
    }else
    {
        self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenNavigationBarHeight - 20)];
    }
    self.navigationView.backgroundColor = [UIColor clearColor];
    [self.navigationImgView addSubview:self.navigationView];
    
    self.navigationTitleLab = [UILabel new];
    self.navigationTitleLab.font = [UIFont boldSystemFontOfSize:ScreenScaleValue(18)];
    [self.navigationView addSubview:self.navigationTitleLab];
    
    [self.navigationTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.navigationView.mas_centerX);
        make.centerY.mas_equalTo(self.navigationView.mas_centerY);
    }];
    
    self.navigationLine = [UIView new];
    self.navigationLine.backgroundColor = ColorFromHex(@"E5E5E5");
    [self.navigationView addSubview:self.navigationLine];
    
    [self.navigationLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.navigationView.mas_bottom);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(0.5);
    }];
    
    self.backBtn = [UIButton new];
    [self.navigationView addSubview:self.backBtn];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.navigationView.mas_centerY);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(30);
    }];
    
    self.rightBtn = [UIButton new];
    [self.navigationView addSubview:self.rightBtn];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.navigationView.mas_centerY);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.backBtn addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightBtn addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

/**设置标题**/
-(void)setTitleText:(NSString *)title{
    self.navigationTitleLab.text = title;
}

#pragma -- 导航左按钮点击事件
- (void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma -- 导航右按钮点击事件
- (void)rightButtonPressed:(id)sender
{
    
}

/**导航栏透明*/
- (void)navigationIsTransparent:(BOOL)isTransparent{
    if (isTransparent) {
        self.navigationImgView.backgroundColor = [UIColor clearColor];
        self.navigationView.backgroundColor = [UIColor clearColor];
    }
}

/**导航栏线透明*/
- (void)navigationLineIsTransparent:(BOOL)isTransparent{
    if (isTransparent) {
        self.navigationLine.hidden = YES;
    }
}

/**设置返回按钮和右侧按钮的图片**/
-(void)setNavigationBackAndRightBtnImg:(NSString *)backImg rightImg:(NSString *)rightImg{
    UIImageView *backImgView = [UIImageView new];
    backImgView.image = [UIImage imageNamed:backImg];
    [self.backBtn addSubview:backImgView];
    
    [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backBtn.mas_centerX);
        make.centerY.mas_equalTo(self.backBtn.mas_centerY);
    }];
    
    UIImageView *rightImgView = [UIImageView new];
    rightImgView.image = [UIImage imageNamed:rightImg];
    [self.rightBtn addSubview:rightImgView];
    
    [rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.rightBtn.mas_centerX);
        make.centerY.mas_equalTo(self.rightBtn.mas_centerY);
    }];
}

/**设置返回按钮的图片**/
-(void)setNavigationBackBtnImg:(NSString *)backImg{
    UIImageView *backImgView = [UIImageView new];
    backImgView.image = [UIImage imageNamed:backImg];
    [self.backBtn addSubview:backImgView];
    
    [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backBtn.mas_centerX);
        make.centerY.mas_equalTo(self.backBtn.mas_centerY);
    }];
}

#pragma mark -- 添加无网络的视图
- (void)initWifiErrorView
{
//    self.wifiErrorView = [[CPNoNetworkView alloc]initWithFrame:CGRectMake(0, ScreenNavigationBarHeight, ScreenWidth, ScreenNavigationBarHeight];
//    self.wifiErrorView.hidden = YES;
//    [self.view addSubview:self.wifiErrorView];
//    [self.wifiErrorView.refreshBtn addTarget:self action:@selector(wifiRefreshBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma -- 刷新网络
- (void)wifiRefreshBtnAction:(UIButton *)sender
{
    
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
