//
//  UIToolHeader.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#ifndef UIToolHeader_h
#define UIToolHeader_h

#import "UITool.h"

/**
 *  快速得到RGB颜色
 */
#define ColorFromRGB(redValue,greenValue,blueValue) [UITool colorFromRed:redValue green:greenValue blue:blueValue]

/**
 *  快速获取随机颜色
 */
#define ColorFromAndomRGB [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

/**
 *  获取带alpha值的RGB颜色
 */
#define ColorFromAndomRGBAlpha(redValue,greenValue,blueValue,alpha) [UITool colorFromRed:redValue green:greenValue blue:blueValue withAlpha:alpha]

/**
 *  从16进制字符中得到颜色
 */
#define ColorFromHex(hexString) [UITool colorFromHexString:hexString]
/**
 *  从16进制字符中得到颜色 可自定义透明度
 */
#define ColorFromHexWithAlpha(hexString,_alpha_) [UITool colorFromHexString:hexString alpha:_alpha_]

/**
 *  从一个View获取翻转的文本绘制的图形上下文CGContextRef
 */
#define ContextRefTextMatrixFromView(aView) [UITool getTextCTMContextRefFromView:aView]

/**
 *  快速获取图片
 */
#define ImageFromName(imageName) [UITool imageWithName:imageName]

/**
 *  创建圆角图片
 */
#define ImageRoundCorner(aImage,cornerSize,boardSize) [UITool createRoundCornerImage:aImage withCornerSize:cornerSize withBoardSize:boardSize]

/**
 *  获取一个View的截图
 */
#define ScreenShotFromView(aView) [UITool viewScreenShot:aView]

/**
 *  获取一个Layer的截图
 */
#define ScreenShotFromLayer(aLayer) [UITool layerScreenShot:aLayer]

/**
 *  按照aColor颜色创建一张size大小的图片
 *
 */
#define ImageByColorWithSize(aColor,size) [UITool imageForColor:aColor withSize:size]

/**
 *  创建一个线性渐变图片
 *
 *  @param colors    按顺序渐变颜色数组
 *  @param size      需要创建的图片的大小
 *
 *  最大只支持三种颜色，起始位置颜色，中间颜色，结束颜色
 *  依次位置为 0,0.5,1.0
 *  超过3种颜色也只取前三种颜色为渐变色
 *
 *  @return 返回渐变颜色图片
 */
#define ImageLinearGradientByColorsWithSize(colors,size) [UITool gradientLinearImageFromColors:colors withImageSize:size]

/**
 *  创建线性渐变图片
 *
 *  @param fromColor 起始发颜色
 *  @param toColor   中间颜色
 *  @param size      图片大小
 *
 *  @return 渐变图片
 */
#define ImageLinearGradientFromColorToColor(fromColor,toColor,size) [UITool gradientLinearImageFromColor:fromColor withToColor:toColor withImageSize:size]

/**
 *  创建球形渐变图片
 *
 *  @param fromColor 中心颜色
 *  @param toColor   外层颜色
 *  @param size      图片大小
 *
 *  @return 渐变图片
 */
#define ImageRadialGradientFromColorToColor(fromColor,toColor,size) [UITool gradientRadialImageFromColor:fromColor withToColor:toColor withImageSize:size]

/**
 *  创建球形渐变图片
 *
 *  @param colors 颜色值数组
 *  @param size 图片大小
 *
 *  @return 渐变图片
 */
#define ImageRadialGradientByColorsWithSize(colors,size) [UITool gradientRadialImageFromColors:colors withImageSize:size]

/**
 *  创建网格线图片
 *
 *  @param lineGap 格线距离
 *  @param color   格线颜色
 *  @param size    图片大小
 *
 *  @return 网格线图片
 */
#define ImageGridByLineGapAndColorWithSize(lineGap,color,size) [UITool gridImageByHoriLineGap:lineGap withVerticalLineGap:lineGap withLineColor:color withImageSize:size]

/**
 *  创建水平网格线图片
 *
 *  @param lineGap 格线距离
 *  @param color   格线颜色
 *  @param size    图片大小
 *
 *  @return 网格线图片
 */
#define ImageGridHorizByLineGapAndColorWithSize(lineGap,color,size) [UITool gridImageHorizonByLineGap:lineGap withLineColor:color withImageSize:size]

/**
 *  创建垂直网格线图片
 *
 *  @param lineGap 格线距离
 *  @param color   格线颜色
 *  @param size    图片大小
 *
 *  @return 网格线图片
 */
#define ImageGridVerticalByLineGapAndColorWithSize(lineGap,color,size) [UITool gridImageVerticalByLineGap:lineGap withLineColor:color withImageSize:size]

/**
 *  跳转界面
 */
#define ToViewController(viewController) [UITool toViewController:viewController]


/**
 *  文字占屏幕大小
 */
#define LabelSize(content,font) [UITool getFontSize:content withFont:font]

/**
 *  文字占屏幕大小
 */
#define LabelSizeMax(content,font,maxWidth,maxHeight) [UITool getFontSize:content withFont:font withMaxWidth:maxWidth withMaxHeight:maxHeight]

/**
 *  带属性文字占屏幕大小
 */
#define LabelSizeWithAtt(content,font,lineSpacingSize) [UITool getFontSize:content withFont:font lineSpacing:lineSpacingSize]

/**
 *  带属性文字站屏幕大小
 */
#define LabelSizeMaxWithAtt(content,font,maxWidth,maxHeight,lineSpacingSize) [UITool getFontSize:content withFont:font withMaxWidth:maxWidth withMaxHeight:maxHeight lineSpacing:(CGFloat )lineSpacingSize]

/**
 *  获取系统自带字体
 */
#define FontWithSize(size) [UITool getFontWitSize:size]

/**
 *  获取系统自带字体粗体
 */
#define BoldFontWithSize(size) [UITool getBoldFontWitSize:size]

/**
 *  获取自定义字体
 */
#define FontNameWithSize(name,size) [UITool getFontWitNameSize:name fontSize:size]


#endif /* UIToolHeader_h */
