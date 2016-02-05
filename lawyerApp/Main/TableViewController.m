//
//  TableViewController.m
//  TestDemo
//
//  Created by apple  on 15/12/11.
//  Copyright © 2015年 apple . All rights reserved.
//

#import "TableViewController.h"
#import "NSString+log.h"
#import "StudentModel.h"
@interface TableViewController ()

@end

@implementation TableViewController
{
    NSArray *_array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    StudentModel *stu = [[StudentModel alloc]init];
    stu.userName = @"何晴";
//    stu.password = @"123";
    [NSString printLog:stu];

    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 664)];
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"TableViewControllerCell"];
    _array = @[@"1",@"2",@"3",@"4",@"U型界面",@"QuickLook",@"IOS H5 交互",@"今日义诊",@"复选框",@"炫酷点赞",@"纯数字输入框",@"AFNetworking",@"13",@"14",@"15"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewControllerCell" forIndexPath:indexPath];
    
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * viewControllerString = [NSString stringWithFormat:@"ViewController00%ld",(long)indexPath.row + 1];
    Class controllerClass = NSClassFromString(viewControllerString);
    
    UIViewController *controller=[[controllerClass alloc]init];
    
    [self.navigationController  pushViewController:controller animated:YES];

}




- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


@end
