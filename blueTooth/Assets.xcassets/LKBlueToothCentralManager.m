//
//  LKBlueToothCentralManager.m
//  blueTooth
//
//  Created by 888 on 16/8/4.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "LKBlueToothCentralManager.h"

@interface LKBlueToothCentralManager ()
{
    id<LKBlueToothCentralManagerDelegate> _myDelegate;
}
@end

@implementation LKBlueToothCentralManager

static LKBlueToothCentralManager *_manager;
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[LKBlueToothCentralManager alloc] init];
        _manager.delegate = _manager.self;
    });
}

+ (void)addDelegate:(id<LKBlueToothCentralManagerDelegate>)delegate
{
    _manager -> _myDelegate = delegate;
}



- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    switch (central.state) {
        case 0:
            if ([_myDelegate respondsToSelector:@selector(blueToothStateChangeToInitializationWithManager:)])
            {
                [_myDelegate blueToothStateChangeToInitializationWithManager:_manager];
            }
            break;
        case 1:
            if ([_myDelegate respondsToSelector:@selector(blueToothStateChangeToResettingWithManager:)])
            {
                [_myDelegate blueToothStateChangeToResettingWithManager:_manager];
            }
            break;
        case 2:
            if ([_myDelegate respondsToSelector:@selector(blueToothStateChangeToNotSupportedWithManager:)])
            {
                [_myDelegate blueToothStateChangeToNotSupportedWithManager:_manager];
            }
            break;
        case 3:
            if ([_myDelegate respondsToSelector:@selector(blueToothStateChangeToWantAuthorityWithManager:)])
            {
                [_myDelegate blueToothStateChangeToWantAuthorityWithManager:_manager];
            }
            break;
        case 4:
            if ([_myDelegate respondsToSelector:@selector(blueToothStateChangeToUnopenedWithManager:)])
            {
                [_myDelegate blueToothStateChangeToUnopenedWithManager:_manager];
            }
            break;
        case 5:
            if ([_myDelegate respondsToSelector:@selector(blueToothStateChangeToDidOpenWithManager:)])
            {
                [_myDelegate blueToothStateChangeToDidOpenWithManager:_manager];
            }
            break;
        default:
            break;
    }
}

+ (LKBlueToothManagerState)getCurrentBlueToothState
{
    switch (_manager.state) {
        case 0:
            return LKBlueToothManagerStateInitialization;
        case 1:
            return LKBlueToothManagerStateResetting;
        case 2:
            return LKBlueToothManagerStateNotSupported;
        case 3:
            return LKBlueToothManagerStateWantAuthority;
        case 4:
            return LKBlueToothManagerStateUnopened;
        case 5:
            return LKBlueToothManagerStateIsOpen;
        default:
            return -1;
    }
}

+ (NSString *)getCurrentBlueToothStateStr
{
    switch (_manager.state) {
        case 0:
            return @"初始化中";
        case 1:
            return @"设备重置";
        case 2:
            return @"设备不支持";
        case 3:
            return @"设备未授权";
        case 4:
            return @"未打开";
        case 5:
            return @"已打开";
        default:
            return @"";
    }
}

@end
