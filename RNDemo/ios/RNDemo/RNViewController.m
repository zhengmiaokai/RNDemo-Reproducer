//
//  RNViewController.m
//  RNDemo
//
//  Created by zhengmiaokai on 2024/1/29.
//

#import "RNViewController.h"
#import <React/RCTRootView.h>
#import "RNBridge.h"

@interface RNViewController () <RCTBridgeDelegate>

@property (nonatomic, strong) RNBridge *bridge;

@end

@implementation RNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* BundleURL
    NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"jsbundle"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation moduleName: @"App" initialProperties:nil launchOptions: nil];
     */
    
    /* Bridge */
    self.bridge = [[RNBridge alloc] initWithDelegate:self launchOptions:nil];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:_bridge moduleName:_moduleName?_moduleName:@"MyReactNativeApp" initialProperties:nil];
    rootView.frame = self.view.bounds;
    [self.view addSubview:rootView];
    
    if (!_bundleUrl) {
        // test code
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"RNSendBroadcastNotification" object:nil
                                                              userInfo:@{@"name": @"EventReminder", @"body": @{@"message": @"this is a message"}}];
        });
    }
  }

#pragma mark - Method -
- (void)enqueueJSCall:(NSString *)module method:(NSString *)method args:(NSArray *)args completion:(dispatch_block_t)completion {
    [self.bridge enqueueJSCall:module method:method args:args completion:completion];
}

#pragma mark - RCTBridgeDelegate  -
- (NSURL *)sourceURLForBridge:(RNBridge *)bridge {
    if (_bundleUrl) {
        return [NSURL URLWithString:_bundleUrl];
    } else {
        return [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"jsbundle"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
