//
//  RNWidgetManager.m
//  RNDemo
//
//  Created by zhengmiaokai on 2024/1/29.
//

#import "RNWidgetManager.h"
#import <React/RCTUIManager.h>
#import "RNWidge.h"

@implementation RNWidgetManager

// UI注册组件
RCT_EXPORT_MODULE(RNWidget)

- (UIView *)view {
    RNWidge *widget = [[RNWidge alloc] init];
    [widget addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    return widget;
}

- (void)touchAction:(RNWidge *)widge {
    if (widge.onTouch) {
        widge.onTouch(@{@"state" : @(widge.state)});
    }
}

// 绑定属性类型
RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(onTouch, RCTBubblingEventBlock);

// 方法注册与实现
RCT_EXPORT_METHOD(reloadData:(nonnull NSNumber *)reactTag data:(NSDictionary *)data atomically:(BOOL)atomically) {
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, RNWidge *> *viewRegistry) {
        RNWidge *widge = viewRegistry[reactTag];
        if (!widge || ![widge isKindOfClass:[RNWidge class]]) {
            RCTLogError(@"Cannot find RNWidge with tag #%@", reactTag);
            return;
        }
        
        [widge reloadData:data atomically:atomically];
    }];
}

@end
