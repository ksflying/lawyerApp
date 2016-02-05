//
//  ASScannerViewController.m
//  DivineQuery
//
//  Created by qianfeng on 15/11/1.
//  Copyright © 2015年 ZYL. All rights reserved.
//

#import "ASScannerViewController.h"
#import <AVFoundation/AVFoundation.h>
//屏幕bounds
#define Screen_Bounds ([UIScreen mainScreen].bounds)
@interface ASScannerViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate>
@property(strong,nonatomic) AVCaptureSession *session; // 捕捉会话
@property(strong,nonatomic)  AVCaptureVideoPreviewLayer *previewLayer;  // 二维码生成的图层
@end

@implementation ASScannerViewController
{
    UIView *_boxView;
    CALayer *_scanLayer;;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title =@"扫一扫";
    [self readQRcode];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)readQRcode
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
#if __IPHONE_OS_VERSION_MIN_REQUIRED <= __IPHONE_8_0
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"提示" message:@"没有摄像头" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        alert.delegate = self;
        [alert show];
#else
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"提示" message:@"没有摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {

        }];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
#endif
        return;
    }
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    [session addInput:input];
    [session addOutput:output];
    
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode,                                       AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeITF14Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeInterleaved2of5Code,AVMetadataObjectTypeUPCECode,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeCode39Mod43Code,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeAztecCode,AVMetadataObjectTypeInterleaved2of5Code,AVMetadataObjectTypeDataMatrixCode]];
    
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:session];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [preview setFrame:Screen_Bounds];
    [self.view.layer insertSublayer:preview atIndex:0];
    
    
    //10.0.扫描框
    _boxView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150,150)];
    _boxView.center = kScreeCenter;
    _boxView.layer.borderColor = [UIColor greenColor].CGColor;
    _boxView.layer.borderWidth = 1.0f;
    [self.scannerView addSubview:_boxView];
    //10.1设置扫描范围

#warning 放开扫描框
    //注释后全屏扫描
    [output setRectOfInterest:CGRectMake((kScreeCenter.y-75)/(kScreeHeight), (kScreeCenter.x-75)/kScreeWidth,150/(kScreeHeight),150/kScreeWidth)];

    //10.2.扫描线
    _scanLayer = [[CALayer alloc] init];
    _scanLayer.frame = CGRectMake(0, 0, _boxView.bounds.size.width, 1);
    _scanLayer.backgroundColor = [UIColor brownColor].CGColor;
    [_boxView.layer addSublayer:_scanLayer];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.15f target:self selector:@selector(moveScanLayer:) userInfo:nil repeats:YES];
    [timer fire];
    
    self.previewLayer = preview;
    [session startRunning];
    self.session = session;
}


- (void)moveScanLayer:(NSTimer *)timer
{
    CGRect frame = _scanLayer.frame;
    if (_boxView.frame.size.height-5 < _scanLayer.frame.origin.y) {
        frame.origin.y = 0;
        _scanLayer.frame = frame;
    }else{
        frame.origin.y += 5;
        [UIView animateWithDuration:0.1 animations:^{
            _scanLayer.frame = frame;
        }];
    }
}

#pragma mark - 输出代理方法
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    [self.session stopRunning];
    [self.previewLayer removeFromSuperlayer];
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        NSString * string = obj.stringValue;
        if (_resultSranner) {
            _resultSranner(string);
        }
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   [self.navigationController popViewControllerAnimated:YES];
}
@end
