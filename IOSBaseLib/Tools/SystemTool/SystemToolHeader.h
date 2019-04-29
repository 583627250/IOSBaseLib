//
//  SystemToolHeader.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#ifndef SystemToolHeader_h
#define SystemToolHeader_h

/**
 *  系统相关的信息
 *
 */

#import "SystemTool.h"

/**
 *  当前App的版本号 1.0.0
 */
#define AppStringVersion [SystemTool appStringVersion]

/**
 * 当前App的版本Build号 1
 */
#define AppBuildCode [SystemTool appBundleStringVersion]

/**
 * 当前App的包名
 */
#define AppBundleIdentifier [SystemTool appBundleIdentifier]

/**
 * 当前版本号是否是提前版本
 */
#define IsAppVersionOver(versionValue) [SystemTool isAppVersionOver:versionValue]

/**
 * 获取手机系统版本
 */
#define DeviceSystemVersion [SystemTool deviceSystemVersion]

/**
 * 获取手机系统名称
 */
#define DeviceSystemName [SystemTool deviceSystemName]

/**
 * 获取手机model
 */
#define DeviceModel [SystemTool deviceModel]

/**
 * 是否是PhoneX
 */
#define IsPhoneX [SystemTool isPhoneXDevice]



/**
 * 是否7系统或以上
 */
#define IsDeviceSystemOver(systemVersion) [SystemTool isSystemVersionOver:systemVersion]

/**
 *  创建self弱引用
 */
#define WeakSelf __weak __typeof(self)

#endif /* SystemToolHeader_h */
