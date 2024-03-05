//
//  AppDelegate.m
//  NewProject
//
//  Created by zhengmiaokai on 2024/1/29.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  
  ViewController *rootVC = [[ViewController alloc] init];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootVC];

  return YES;
}

@end
