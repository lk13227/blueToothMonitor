//
//  ViewController.m
//  blueTooth
//
//  Created by 888 on 16/8/4.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "ViewController.h"

#import <CoreBluetooth/CoreBluetooth.h>

#import "LKBlueToothCentralManager.h"

@interface ViewController () <LKBlueToothCentralManagerDelegate> //<CBCentralManagerDelegate>

// 蓝牙检测
//@property (nonatomic,strong)CBCentralManager *centralManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LKBlueToothCentralManager addDelegate:self];
    
    // 蓝牙检测
    //self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
}

//#pragma mark - CLLocationManagerDelegate
//-(void)centralManagerDidUpdateState:(CBCentralManager *)central
//{
//    //第一次打开或者每次蓝牙状态改变都会调用这个函数
//    if(central.state==CBCentralManagerStatePoweredOn)
//    {
//        NSLog(@"蓝牙设备开着");
//    }
//    else
//    {
//        NSLog(@"蓝牙设备关着");
//    }
//}

    //点击屏幕获得蓝牙状态
    - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
    {
        NSLog(@"蓝牙状态字符串%@",[LKBlueToothCentralManager getCurrentBlueToothStateStr]);
        NSLog(@"蓝牙状态%zd--主要用来对比自定的枚举",[LKBlueToothCentralManager getCurrentBlueToothState]);
    }

    /** 蓝牙初始化中 **/
    - (void)blueToothStateChangeToInitializationWithManager:(LKBlueToothCentralManager *)manager
    {
        NSLog(@"蓝牙初始化中");
    }
    /** 蓝牙重置 **/
    - (void)blueToothStateChangeToResettingWithManager:(LKBlueToothCentralManager *)manager
    {
        NSLog(@"蓝牙重置");
    }
    /** 设备不支持蓝牙 **/
    - (void)blueToothStateChangeToNotSupportedWithManager:(LKBlueToothCentralManager *)manager
    {
        NSLog(@"设备不支持蓝牙");
    }
    /** 设置未授权蓝牙 **/
    - (void)blueToothStateChangeToWantAuthorityWithManager:(LKBlueToothCentralManager *)manager
    {
        NSLog(@"设置未授权蓝牙");
    }
    /** 未打开蓝牙状态 **/
    - (void)blueToothStateChangeToUnopenedWithManager:(LKBlueToothCentralManager *)manager
    {
        NSLog(@"未打开蓝牙状态");
    }
    /** 蓝牙开启成功 **/
    - (void)blueToothStateChangeToDidOpenWithManager:(LKBlueToothCentralManager *)manager
    {
        NSLog(@"蓝牙开启成功");
    }

@end










