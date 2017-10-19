//
//  TTTestWebViewController1.m
//  TTProject
//
//  Created by vanke on 2017/10/19.
//  Copyright © 2017年 Evan. All rights reserved.
//

#import "TTTestWebViewController.h"

@interface TTTestWebViewController ()

@end

@implementation TTTestWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//JavascriptBridge
- (IBAction)jumpWebURL:(id)sender {
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BaseWebViewID"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


//JavascriptCore
- (IBAction)jumpBaseWebViewController:(id)sender {
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BaseWebViewControllerID"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
