//
//  ScreenTool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenTool : NSObject

+ (CGRect)screenBounds;

+ (CGFloat)screenScale;

+ (NSString *)screenStringScale;

+ (CGSize)screenSize;

+ (CGFloat)screenNoNavigationBarHeight;

+ (CGFloat)screenNoTabBarHeight;

+ (CGFloat)screenNoBarHeight;

+ (CGFloat)screenScaleValue:(CGFloat)sizeValue;

+ (CGFloat)navigationBarHeight;

+ (CGFloat)tabBarHeight;

@end

NS_ASSUME_NONNULL_END
