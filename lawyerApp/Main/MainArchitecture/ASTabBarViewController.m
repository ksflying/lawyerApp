//
//  ASTabBarViewController.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ASTabBarViewController.h"
#import "ASNavigationController.h"


@interface ASTabBarViewController ()<UITabBarControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ASTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    
    //NSLog(@"标签栏frame%@",NSStringFromCGRect(self.tabBar.frame));
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) setcontroller:(NSString *)controllerName title:(NSString *) title imageNamed:(NSString *)imageName selectedImageName:(NSString *)selectedImage
{
    
    Class controllerClass=NSClassFromString(controllerName);
    UIViewController *controller=[[controllerClass alloc]init];
    
    controller.title=title;
   
    UIImage *normalImage=[[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIImage *selectImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    controller.tabBarItem=[[UITabBarItem alloc]initWithTitle:title image:normalImage selectedImage:selectImage];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = COLOR(123, 123, 123, 1);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [controller.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    ASNavigationController *nc=[[ASNavigationController alloc]initWithRootViewController:controller];
    
    NSMutableArray *array=[NSMutableArray arrayWithArray:self.viewControllers];
    [array addObject:nc];
    self.viewControllers=array;
    
}

/**
 *  创建tabBar
 */
-(void)createtabBarController
{
    [self setcontroller:@"ViewControllerFirst" title:@"first" imageNamed:@"bar_item001.png" selectedImageName:@"_bar_item001.png"];
    [self setcontroller:@"ViewControllerSecond" title:@"second" imageNamed:@"bar_item002.png" selectedImageName:@"_bar_item002.png"];
    [self setcontroller:@"ViewControllerThird" title:@"third" imageNamed:@"bar_item004" selectedImageName:@"_bar_item004.png"];
    self.selectedViewController=self.viewControllers[0];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{

    NSLog(@"%@",item.title);

}






















@end
