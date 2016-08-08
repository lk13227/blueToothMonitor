//
//  LKBlueToothCentralManager.h
//  blueTooth
//
//  Created by 888 on 16/8/4.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>
#import <Foundation/Foundation.h>

@class LKBlueToothCentralManager;

@protocol LKBlueToothCentralManagerDelegate <NSObject>

@optional
/** 蓝牙初始化中 **/
- (void)blueToothStateChangeToInitializationWithManager:(LKBlueToothCentralManager *)manager;
/** 蓝牙重置 **/
- (void)blueToothStateChangeToResettingWithManager:(LKBlueToothCentralManager *)manager;
/** 设备不支持蓝牙 **/
- (void)blueToothStateChangeToNotSupportedWithManager:(LKBlueToothCentralManager *)manager;
/** 设置未授权蓝牙 **/
- (void)blueToothStateChangeToWantAuthorityWithManager:(LKBlueToothCentralManager *)manager;
/** 未打开蓝牙状态 **/
- (void)blueToothStateChangeToUnopenedWithManager:(LKBlueToothCentralManager *)manager;
/** 蓝牙开启成功 **/
- (void)blueToothStateChangeToDidOpenWithManager:(LKBlueToothCentralManager *)manager;

@end


typedef NS_ENUM(NSInteger)
{
    LKBlueToothManagerStateInitialization = 0, // *状态未知
    LKBlueToothManagerStateResetting = 1,      // *状态重置
    LKBlueToothManagerStateNotSupported = 2,   // *设备不支持
    LKBlueToothManagerStateWantAuthority = 3,  // *设为未授权
    LKBlueToothManagerStateUnopened = 4,       // *设备未打开
    LKBlueToothManagerStateIsOpen = 5,         // *设备已打开
}LKBlueToothManagerState;


@interface LKBlueToothCentralManager : CBCentralManager <CBCentralManagerDelegate>

/** 添加代理 **/
+ (void)addDelegate:(id<LKBlueToothCentralManagerDelegate>)delegate;
/** 获取当前用户蓝牙状态 **/
+ (LKBlueToothManagerState)getCurrentBlueToothState;
/** 获取当前用户蓝牙状态字符串 **/
+ (NSString *)getCurrentBlueToothStateStr;

@end
