//
//  UITool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITool : NSObject

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue withAlpha:(CGFloat)alpha;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (CGContextRef)getTextCTMContextRefFromView:(UIView *)aView;

+ (UIImage *)viewScreenShot:(UIView *)aView;

+ (UIImage *)layerScreenShot:(CALayer *)layer;

+ (UIImage *)imageWithName:(NSString *)imageName;

+ (UIImage *)createRoundCornerImage:(UIImage *)aImage withCornerSize:(NSInteger)cornerSize withBoardSize:(NSInteger)boardSize;

/* 根据颜色创建图片 */
+ (UIImage *)imageForColor:(UIColor*)aColor withSize:(CGSize)aSize;

+ (UIImage *)gradientLinearImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;

+ (UIImage *)gradientLinearImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size;

+ (UIImage *)gradientRadialImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size;

+ (UIImage *)gradientRadialImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;

+ (UIImage *)gridImageByHoriLineGap:(CGFloat)hLineGap withVerticalLineGap:(CGFloat)vLineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size;

+ (UIImage *)gridImageHorizonByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size;

+ (UIImage *)gridImageVerticalByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size;

+ (void)toViewController:(UIViewController *)viewController;

+ (CGRect)getFontSize:(NSString *)string withFont:(UIFont *)font;

+ (CGRect)getFontSize:(NSString *)string withFont:(UIFont *)font withMaxWidth:(CGFloat )maxWidth withMaxHeight:(CGFloat )maxHeight;

+ (CGRect)getFontSizeWithAtt:(NSString *)string withFont:(UIFont *)font lineSpacing:(CGFloat )lineSpacingSize;

+ (CGRect)getFontSizeWithAtt:(NSString *)string withFont:(UIFont *)font withMaxWidth:(CGFloat )maxWidth withMaxHeight:(CGFloat )maxHeight lineSpacing:(CGFloat )lineSpacingSize;

+ (UIFont *)getFontWitSize:(CGFloat)size;

+ (UIFont *)getBoldFontWitSize:(CGFloat)size;

+ (UIFont *)getFontWitNameSize:(NSString *)name fontSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
