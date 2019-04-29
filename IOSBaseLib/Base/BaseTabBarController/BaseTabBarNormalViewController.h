//
//  BaseTabBarNormalViewController.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/22.
//  Copyright © 2019 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarNormalViewController : UITabBarController

-(void)setTitleInfo:(UIColor *)normalColor normalFontSize:(UIFont *)normalSize selectedColor:(UIColor *)selectedColor selectedFontSize:(UIFont *)selectedSize;

- (void)addChildrenViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end

NS_ASSUME_NONNULL_END
