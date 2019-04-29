//
//  BaseViewController.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property (nonatomic, strong) UIImageView *navigationImgView;
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UILabel *navigationTitleLab;
@property (nonatomic, strong) UIView *navigationLine;



/**导航栏透明*/
- (void)navigationIsTransparent:(BOOL)isTransparent;

/**导航栏线透明*/
- (void)navigationLineIsTransparent:(BOOL)isTransparent;

/**设置返回按钮和右侧按钮的图片**/
-(void)setNavigationBackAndRightBtnImg:(NSString *)backImg rightImg:(NSString *)rightImg;

/**设置返回按钮的图片**/
-(void)setNavigationBackBtnImg:(NSString *)backImg;

/**设置标题**/
-(void)setTitleText:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
