//
//  RNWidge.h
//  RNDemo
//
//  Created by zhengmiaokai on 2024/1/29.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNWidge : UIButton

@property (nonatomic, copy) RCTBubblingEventBlock onTouch;

- (void)reloadData:(NSDictionary *)data atomically:(BOOL)atomically;

@end

NS_ASSUME_NONNULL_END
