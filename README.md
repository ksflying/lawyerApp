## IOS
by-ksflying
by-HQFlying
###2016年1月21日 

* 自定义tabbar框架 设置标题,图片,选中图片以及背景

```
//初始化
#import "ASTabBarViewController.h"
- (void)createtabBarController
{
    [self setcontroller:@"ViewControllerFirst" title:@"first" imageNamed:@"bar_item001.png" selectedImageName:@"_bar_item001.png"];
    [self setcontroller:@"ViewControllerSecond" title:@"second" imageNamed:@"bar_item002.png" selectedImageName:@"_bar_item002.png"];
    [self setcontroller:@"ViewControllerThird" title:@"third" imageNamed:@"bar_item004" selectedImageName:@"_bar_item004.png"];
    self.selectedViewController=self.viewControllers[0];
}
//调用
#import "AppDelegate.h"
-(void) tabBarController{
    ASTabBarViewController *tabBarController=[[ASTabBarViewController alloc]init];
    tabBarController.delegate=self;
    //tabBar背景图片
    //tabBarController.tabBar.backgroundImage=[UIImage imageNamed:@"005.jpg"];
    tabBarController.tabBar.clipsToBounds=YES;
    [tabBarController createtabBarController];
    self.window.rootViewController=tabBarController;
    [self.window.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1.0f];
}
```
* 自定义导航栏按钮

```
#import "ASNaviagtionItem.h"
//返回按钮
  [ASNaviagtionItem createBackNavigationItem:self image:@"na_back.png"];
//右按钮
    [ASNaviagtionItem createRightNavigationItem:self image:@"bar_item003.png" action:^(ASNaviagtionItem *sender) {
        NSLog(@"右按钮");
    }];
#import "HQSearchBar.h"
//搜索框
    HQSearchBar *searchBar = [HQSearchBar searchBar];
    self.searchBar = searchBar;
    self.searchBar.delegate = self;
    searchBar.width = 300;
    searchBar.height = 30;
```

* 定义常用宏


```
ASMacros.h
//屏幕bounds
#define kScreen_Bounds ([UIScreen mainScreen].bounds)
//屏幕宽度
#define kScreeWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define kScreeHeight [UIScreen mainScreen].bounds.size.height
//屏幕中心点
#define kScreeCenter (CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2))
//当前视图高
#define kSelfViewHeight (self.frame.size.height)
//当前视图宽
#define kSelfViewWidth (self.frame.size.width)
//除去导航栏和TabBar的Frame
#define kTableFrame (CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49))


//根视图
#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])
//根控制器
#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])
//根window
#define AppRootWindow  ([[[UIApplication sharedApplication] delegate] window])

//当前系统版本
#define SystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]  


//rgb颜色转换（16进制->10进制） UIColorFromRGB(0x82a1b7)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//设置颜色RGB
#define COLOR(R, G, B, A) ([UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A])

//检测block是否可用
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

//DEBUG  模式下打印日志,当前行
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

```
* 定义常量


```
ASContstant.h
//0表示开发环境 1表示生产环境
#define kDevelopmentOrProduction 0

#if kDevelopmentOrProduction
    #define kBaseUrl @"http://tnfs.tngou.net/Production"
#else
    #define kBaseUrl @"http://tnfs.tngou.net/Development"
#endif

//第一次运行
#define isFirstRun @"isFirstRun"
//导航栏高度
#define NavigationBar_HEIGHT   44.f
// 状态栏高度
#define  StatusBarHeight       20.f
// 状态栏高度 + 导航栏高度
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)
// 标签栏高度
#define  TabbarHeight          49.f

#define  iPhone4_4s   (Width == 320.f && Height == 480.f ? YES : NO)
#define  iPhone5_5s   (Width == 320.f && Height == 568.f ? YES : NO)
#define  iPhone6      (Width == 375.f && Height == 667.f ? YES : NO)
#define  iPhone6_plus (Width == 414.f && Height == 736.f ? YES : NO)
```
* 对AFNetworking简单封装 #import "ASRequest.h"
* 自定义Button

```
#import "ASButton.h"
    ASButton *nextBtn = [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(200, 200, 100, 100) title:@"next" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        NextViewController *nextVC = [[NextViewController alloc]init];
        [self.navigationController pushViewController:nextVC animated:YES];
        ;
    }];
    nextBtn.center = kScreeCenter;
    [self.view addSubview:nextBtn];
```
###2016年1月26日 
* 自定义alertView,目前提供三种样式

```
#import "ASAlertView.h"
/**
 *  根具系统版本选择提示框
 *
 *  @param message 提示消息
 */
+(void)alertMessage:(NSString*)message;


/**
 *  消息提示，timeInterval秒后消失
 *
 *  @param message 提示消息
 */
+(void)showMessage:(NSString *)message;


//未完善效果，有点小丑
/**
 *  带遮罩提示框
 *
 *  @param message 提示消息
 */
+(void)alertMessageWithMaskView:(NSString*)message;
```
* 图片浏览 传入要浏览的图片数组(必选)设置默认滚动到第几页(选填)，支持放大缩小。

```
#import "ASBigImages.h"
 ASBigImages *BigImage = [[ASBigImages alloc]init];
    BigImage.imageRuls = _ImageArray;
    BigImage.selectIndex = 2;
    [self.navigationController pushViewController:BigImage animated:YES];
```
* 从相册或者相机返回照片

```
-(void) addIMage
{
#if __IPHONE_OS_VERSION_MIN_REQUIRED <= __IPHONE_8_0
    
    //上传图片操作开始，选择图片的来源
    UIActionSheet*menu=[[UIActionSheet alloc]
                        initWithTitle:@"照片录入"
                        delegate:self
                        cancelButtonTitle:@"取消"
                        destructiveButtonTitle:nil
                        otherButtonTitles:@"拍照",@"从相册上传",nil];
    menu.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [menu showInView:self.view];
    
#else
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:@"照片录入" preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        ;
    }];
    UIAlertAction *takePtotoAction=[UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self shareForGetCamera];
        
    }];
    UIAlertAction *ptotoAction=[UIAlertAction actionWithTitle:@"从相册上传" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self shareForGetPicture];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:takePtotoAction];
    [alertController addAction:ptotoAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
#endif
    
}

-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0){
        
        [self shareForGetCamera];
        
        
    }else if(buttonIndex==1){
        [self shareForGetPicture];
        
    }
    
}


-(void)shareForGetCamera
{
    [ASAlbum sharedPictureFromCamera:^(UIImage *image) {
        if (image!=nil) {
            //取得照片
        }

    }];
    
}


-(void)shareForGetPicture
{
    [ASAlbum sharedPictureFromAlbum:^(UIImage *image) {
        if (image!=nil) {
			//取得照片
        }

    }];
    
}

```
###2016年2月2日
* 添加分类 正则表达式匹配(号码,手机号码,qq号,帐号)
* UIColor 渐变颜色（Gradient） 随机颜色（Random）
* UIImageView 快速创建ImageView 有点击事件
* UIView view抖动(Shake) 修改view frame相关属性（Frame）
* UIButton 避免按钮重复点击(repeatClick)

###2016年2月4日
* 单选按钮

```
/*
 修改zhangyuc 支持分组单选
 使用方法:
 1.初始化button 并且设置组别(GroupId) 
   ZYRadioButton *rb = [[ZYRadioButton alloc] initWithGroupId:@"typeSelect_Group" index:i];
 2.设置button的frame
 3.设置lable的frame以及其值
 4.添加观察者 [ZYRadioButton addObserverForGroupId:@"typeSelect_Group" observer:self];
 注:
 有多少组设置多少观察者,同一工程内组别(GroupId)不要相同
 */
```
* 原生二维码扫描
	
```
使用方法
ASScannerViewController * scanner = [[ASScannerViewController alloc] init];
        scanner.resultSranner = ^(NSString * string){
            NSLog(@"%@",string);
        };
```


