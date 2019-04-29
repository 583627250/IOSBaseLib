//
//  BaseTabBarViewController.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import "MCTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarViewController : MCTabBarController

-(void)setCenterItem:(NSString *)image selectedImage:(NSString *)selectedImage itemWidth:(CGFloat)itemWidth itemHeight:(CGFloat)itemHeight normalColor:(UIColor *)normalColor normalFontSize:(UIFont *)normalSize selectedColor:(UIColor *)selectedColor selectedFontSize:(UIFont *)selectedSize;

- (void)addChildrenViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end

NS_ASSUME_NONNULL_END
