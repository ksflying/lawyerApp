//
//  AppDelegate.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/1/12.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "AppDelegate.h"
#import "ASTabBarViewController.h"
#import "StartViewController.h"
#import "CoreNewFeatureVC.h"
#import "CALayer+Transition.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //判断是否需要显示：（内部已经考虑版本及本地版本缓存）
    BOOL canShow = [CoreNewFeatureVC canShowNewFeature];
    
    //测试代码，正式版本应该删除
        canShow = YES;
    //逗逼何晴
    
    if(canShow){
        
        
        NewFeatureModel *m2 = [NewFeatureModel model:[UIImage imageNamed:@"new_feature_1"]];
        NewFeatureModel *m3 = [NewFeatureModel model:[UIImage imageNamed:@"new_feature_2"]];
        NewFeatureModel *m4 = [NewFeatureModel model:[UIImage imageNamed:@"new_feature_3"]];
        
        self.window.rootViewController = [CoreNewFeatureVC newFeatureVCWithModels:@[m2,m3,m4] enterBlock:^{
            
            [self tabBarController];
        }];
        
    }else{
        
        [self tabBarController];
    }

    
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}


-(void) tabBarController{
    ASTabBarViewController *tabBarController=[[ASTabBarViewController alloc]init];
    
    tabBarController.delegate=self;
    //tabBarController.tabBar.backgroundImage=[UIImage imageNamed:@"005.jpg"];
    tabBarController.tabBar.clipsToBounds=YES;
    [tabBarController createtabBarController];
    self.window.rootViewController=tabBarController;
    [self.window.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.0f];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
