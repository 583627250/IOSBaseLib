//
//  SystemTool.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import "SystemTool.h"
#import <SDVersion.h>

@implementation SystemTool

+ (NSString *)appStringVersion
{
    NSDictionary *infoDict = [[NSBundle mainBundle]infoDictionary];
    return infoDict[@"CFBundleShortVersionString"];
}

+ (NSString *)appBundleStringVersion
{
    NSDictionary *infoDict = [[NSBundle mainBundle]infoDictionary];
    return infoDict[@"CFBundleVersion"];
}

+ (NSString *)appBundleIdentifier
{
    return [[NSBundle mainBundle]bundleIdentifier];
}

+ (BOOL)isAppVersionOver:(NSString *)versionValue
{
    return [[AppStringVersion stringByReplacingOccurrencesOfString:@"." withString:@""] intValue] > [[versionValue stringByReplacingOccurrencesOfString:@"." withString:@""] intValue];
}

+ (NSString *)deviceSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)deviceSystemName
{
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)deviceModel
{
    NSString *model = stringFromDeviceVersion([SDVersion deviceVersion]);
    if ([model isEqualToString:stringFromDeviceVersion(0)]) {
        model = [UIDevice currentDevice].model;
    }
    return model;
}

+ (BOOL)isPhoneXDevice
{
    if (ScreenAllHeight == 812) {
        //X XS
        return YES;
    } else if (ScreenAllHeight == 896){
        //XR XSMAX
        return YES;
    }
    return NO;
}

+ (BOOL)isSystemVersionIs7{
    BOOL result = NO;
    
    float verson = [[UIDevice currentDevice].systemVersion floatValue];
    if (verson >= (float)7.0 && verson < (float)7.1) {
        // 7.0
        result = YES;
    }
    
    return result;
}

+ (BOOL)isSystemVersionOver:(CGFloat)systemVersion{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= systemVersion) {
        return YES;
    }
    return NO;
}

@end
