//
//  BaseTabBarNormalViewController.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/22.
//  Copyright © 2019 scc. All rights reserved.
//

#import "BaseTabBarNormalViewController.h"

@interface BaseTabBarNormalViewController ()

@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIFont *normalFont;

@property (nonatomic, strong) UIColor *selectedColor;

@property (nonatomic, strong) UIFont *selectedFont;


@end

@implementation BaseTabBarNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)setTitleInfo:(UIColor *)normalColor normalFontSize:(UIFont *)normalSize selectedColor:(UIColor *)selectedColor selectedFontSize:(UIFont *)selectedSize{
    //选中时的颜色
    self.tabBar.tintColor = selectedColor;
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.tabBar.translucent = NO;
    self.normalColor = normalColor;
    self.normalFont = normalSize;
    self.selectedColor = selectedColor;
    self.selectedFont = selectedSize;
}

- (void)addChildrenViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    childVC.title = title;
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //未选中字体颜色
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:self.normalColor,NSFontAttributeName:self.normalFont} forState:UIControlStateNormal];
    //选中字体颜色
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:self.selectedColor,NSFontAttributeName:self.selectedFont} forState:UIControlStateSelected];
    [childVC.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-3)];
    [self addChildViewController:childVC];
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
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
