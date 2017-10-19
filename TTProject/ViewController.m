//
//  ViewController.m
//  TTProject
//
//  Created by Evan on 16/7/27.
//  Copyright © 2016年 Evan. All rights reserved.
//

#import "ViewController.h"
#import "TTRuntimeViewController.h"
//#import "TTTestWebViewController.h"
//#import "TTDataParserViewController.h"
#import "TTContactViewController.h"
#import "TTBaseViewController.h"
#import "TTBaseNavigationController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (nonatomic, strong) NSArray *demoLists;
@property (nonatomic, strong) UIImageView *barImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.title = @"Function List";
    self.listView.delegate = self;
    self.listView.dataSource = self;
    self.demoLists = @[@"运行时Demo", @"通讯录", @"基类控制器"];
//    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
//    LogError(@"Test Error System!");
    //[self testMutableCopy];
}

//- (void)testCopy {
//    
//    NSArray *array = @[@"array1", @"array2", @"array3"];
//    NSArray *copyArray = [array copy];
//    
//    LogInfo(@"array: %p", array);
//    LogInfo(@"cppyArray: %p", copyArray);
//}

//- (void)testMutableCopy {
//    
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
//    [array addObject:@"array1"];
//    [array addObject:@"array2"];
//    [array addObject:@"array3"];
//    NSMutableArray *copyArray = [array mutableCopy];
//   
//    LogInfo(@"array: %p", array);
//    
//    LogInfo(@"cppyArray: %p", copyArray);
//    
//    //
//    for (NSString *str in array) {
//        LogInfo(@"copy前str: %p", str);
//    }
//    
//    //
//    for (NSString *str in copyArray) {
//        LogInfo(@"copy后str: %p", str);
//    }
//}
#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _demoLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY"];
    }
    cell.textLabel.text = _demoLists[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.listView deselectRowAtIndexPath:indexPath animated:YES];

    switch (indexPath.row) {
        case 0:
        {
            TTRuntimeViewController *targetViewController  = [[TTRuntimeViewController alloc]
                                                              initWithNibName:@"TTRuntimeViewController" bundle:nil];
            [self.navigationController pushViewController:targetViewController animated:YES];
            
        }
            break;
        case 1:
        {
            TTContactViewController *contactVC = [[TTContactViewController alloc]
                                                  initWithNibName:@"TTContactViewController" bundle:nil];
            [self.navigationController pushViewController:contactVC animated:YES];
            
        }
            break;
        case 2:
        {
            TTBaseViewController *baseViewController = [[TTBaseViewController alloc] init];
            TTBaseNavigationController *baseNav = [[TTBaseNavigationController alloc] initWithRootViewController:baseViewController];
            [self.navigationController pushViewController:baseNav animated:YES];
        }
            break;
        case 3:
        {
           
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        default:
            break;
    }
}



@end
