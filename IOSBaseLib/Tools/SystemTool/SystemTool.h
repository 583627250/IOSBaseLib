//
//  SystemTool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SystemTool : NSObject

+ (NSString *)appStringVersion;

+ (NSString *)appBundleStringVersion;

+ (NSString *)appBundleIdentifier;

+ (BOOL)isAppVersionOver:(NSString *)versionValue;

+ (NSString *)deviceSystemVersion;

+ (NSString *)deviceSystemName;

+ (NSString *)deviceModel;

+ (BOOL)isPhoneXDevice;

+ (BOOL)isSystemVersionOver:(CGFloat)systemVersion;

@end

NS_ASSUME_NONNULL_END
