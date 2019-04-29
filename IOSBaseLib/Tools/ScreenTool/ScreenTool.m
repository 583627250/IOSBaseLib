//
//  ScreenTool.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import "ScreenTool.h"

@implementation ScreenTool

+ (CGRect)screenBounds
{
    return [UIScreen mainScreen].bounds;
}

+ (CGFloat)screenScale
{
    return [UIScreen mainScreen].scale;
}

+ (NSString *)screenStringScale
{
    return [NSString stringWithFormat:@"%d",(int)[UIScreen mainScreen].scale];
}

+ (CGSize)screenSize
{
    return [UIScreen mainScreen].bounds.size;
}

+ (CGFloat)navigationBarHeight
{
    if (IsPhoneX) {
        return 88;
    }else
    {
        return 64;
    }
}

+ (CGFloat)tabBarHeight
{
    if (IsPhoneX) {
        return (49 + 34);
    }else
    {
        return 49;
    }
}

+ (CGFloat)screenNoNavigationBarHeight
{
    if (IsPhoneX) {
        return ScreenAllHeight - [ScreenTool navigationBarHeight] - 43;
    }else
    {
        return ScreenAllHeight - [ScreenTool navigationBarHeight];
    }
}

+ (CGFloat)screenNoTabBarHeight
{
    if (IsPhoneX) {
        return ScreenAllHeight - [ScreenTool tabBarHeight] - 43;
    }else
    {
        return ScreenAllHeight - [ScreenTool tabBarHeight];
    }
}

+ (CGFloat)screenNoBarHeight
{
    if (IsPhoneX) {
        return ScreenAllHeight - [ScreenTool navigationBarHeight] - [ScreenTool tabBarHeight] - 43;
    }else
    {
        return ScreenAllHeight - [ScreenTool navigationBarHeight] - [ScreenTool tabBarHeight];
    }
}

+ (CGFloat)screenScaleValue:(CGFloat)sizeValue{
    return sizeValue / 375 * ScreenWidth;
}

@end
