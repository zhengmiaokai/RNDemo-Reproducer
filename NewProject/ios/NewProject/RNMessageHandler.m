//
//  RNMessageHandler.m
//  RNDemo
//
//  Created by zhengmiaokai on 2024/1/29.
//  Native-JS 广播

#import "RNMessageHandler.h"

@implementation RNMessageHandler

RCT_EXPORT_MODULE(JSBridge)

RCT_EXPORT_METHOD(invokeJSAPI:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback) {
  NSLog(@"params: %@", params);
  
  /* Native调用RN的JSModule方法
   [self.callableJSModules invokeModule:@"JSModule" method:@"calbackName" withArgs:@[]];
   */
  
  /* Native向RN发送广播
   [[NSNotificationCenter defaultCenter] postNotificationName:@"RNSendBroadcastNotification" object:nil userInfo:@{@"name": @"EventReminder", @"body": @{@"message": @"this is a message"}}];
   */
  
  if (callback) { // JSBridge一对一回调
    callback(@[[NSNull null], @{@"code": @0, @"message": @"success"}]);
  }
}

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

- (NSArray<NSString *> *)supportedEvents {
  return  @[@"EventReminder"]; // 事件不存在会报错，不影响整体流程
}

- (void)sendBroadcast:(NSNotification *)notification {
  NSString *name = [notification.userInfo objectForKey:@"name"] ? [notification.userInfo objectForKey:@"name"] : @"EventReminder";
  NSDictionary *body = [notification.userInfo objectForKey:@"body"];
  [self sendEventWithName:name body:body];
}

- (void)startObserving {
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendBroadcast:) name:@"RNSendBroadcastNotification" object:nil];
}

- (void)stopObserving {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RNSendMessageNotification" object:nil];
}

@end
