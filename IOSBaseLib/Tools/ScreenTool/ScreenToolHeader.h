//
//  ScreenToolHeader.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#ifndef ScreenToolHeader_h
#define ScreenToolHeader_h

#import "ScreenTool.h"

/**
 * 获取手机屏幕的Bounds
 */
#define ScreenBounds [ScreenTool screenBounds]

/**
 * 获取手机屏幕比例 Float
 */
#define ScreenScale [ScreenTool screenScale]


/**
 * 获取手机屏幕比例 String
 */
#define ScreenStringScale [ScreenTool screenStringScale]

/**
 * 获取手机屏幕大小
 */
#define ScreenSize [ScreenTool screenSize]

/**
 * 获取手机屏幕宽
 */
#define ScreenWidth [ScreenTool screenSize].width

/**
 * 获取手机屏幕高
 */
#define ScreenAllHeight [ScreenTool screenSize].height

/**
 * 获取手机屏幕高不包含NavigationBar高度（iPhone X 会减 34）
 */
#define ScreenNoNoNavigationBarHeight [ScreenTool screenNoNavigationBarHeight]

/**
 * 获取手机屏幕高不包含tabbar高度（iPhone X 会减 34）
 */
#define ScreenNoTabBarHeight [ScreenTool screenNoTabBarHeight]

/**
 * 获取手机屏幕高不包含tabbar高度也不包含tabBar高度（iPhone X 会减 34）
 */
#define ScreenNoBarHeight [ScreenTool screenNoBarHeight]

/**
 * 等比例计算文字大小,宽,高等等大小
 */
#define ScreenScaleValue(sizeValue) [ScreenTool screenScaleValue:sizeValue]

/**
 * 状态栏高度
 */
#define ScreenNavigationBarHeight [ScreenTool navigationBarHeight]

/**
 * 菜单栏高度
 */
#define ScreenTabBarHeight(sizeValue) [ScreenTool tabBarHeight]

#endif /* ScreenToolHeader_h */
