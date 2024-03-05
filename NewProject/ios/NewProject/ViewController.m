//
//  ViewController.m
//  NewProject
//
//  Created by zhengmiaokai on 2024/1/29.
//

#import "ViewController.h"
#import "RNViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)openBundleUrl:(id)sender {
    RNViewController *rnVC = [[RNViewController alloc] init];
    rnVC.bundleUrl = _bundleUrlTF.text;
    rnVC.moduleName = _moduleNameTF.text;
    [self.navigationController pushViewController:rnVC animated:YES];
}

- (IBAction)openBundInJsBundle:(id)sender {
    RNViewController *rnVC = [[RNViewController alloc] init];
    [self.navigationController pushViewController:rnVC animated:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_bundleUrlTF resignFirstResponder];
    [_moduleNameTF resignFirstResponder];
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

