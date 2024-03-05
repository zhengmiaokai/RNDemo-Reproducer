//
//  ViewController.h
//  NewProject
//
//  Created by zhengmiaokai on 2024/1/29.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *bundleUrlTF;
@property (nonatomic, strong) IBOutlet UITextField *moduleNameTF;

- (IBAction)openBundleUrl:(id)sender;

- (IBAction)openBundInJsBundle:(id)sender;

@end

