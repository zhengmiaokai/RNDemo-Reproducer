//
//  RNMessageHandler.h
//  RNDemo
//
//  Created by zhengmiaokai on 2024/1/29.
//  Native-JS双向通讯

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNMessageHandler : RCTEventEmitter <RCTBridgeModule>

@end

NS_ASSUME_NONNULL_END
