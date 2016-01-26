//
//  ASBigImages.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//
#import "ASBigImages.h"


@interface ASBigImages ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@end

@implementation ASBigImages
{
    CGFloat lastScale;
    UIImageView *_imageView;
    CGRect _oldFrame;
    BOOL _firstTouch;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiInit];
    self.mySV.contentSize=CGSizeMake(kScreeWidth*_imageRuls.count, 0);
    
    self.mySV.delegate = self;
    
    
    self.mySV.showsHorizontalScrollIndicator=YES;
    self.mySV.showsVerticalScrollIndicator=NO;
    
    //添加子view
    
    for (int i=0; i<_imageRuls.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((i)*kScreeWidth,-64 , kScreeWidth, kScreeHeight-64)];
        
        imageView.contentMode=UIViewContentModeScaleToFill;
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = _imageRuls[i];
        [self.mySV addSubview:imageView];
        
        //打开交互
        imageView.userInteractionEnabled = YES;
        //给imageView添加捏合手势
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(scaGesture:)];
        pinchRecognizer.delegate=self;
        [imageView addGestureRecognizer:pinchRecognizer];
        
        
    }
    
    double x=self.selectIndex*kScreeWidth;
    //让scrollView滚动到正确位置
    self.mySV.contentOffset=CGPointMake(x, 0);
    
    self.mySV.pagingEnabled=YES;//页模式
   
    
    _firstTouch = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) uiInit
{

    [self.navigationItem setTitle:@"图片"];
}
//滑动结束
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //滑动图片时将已经放大或缩小的图片还原
    if (_firstTouch == NO) {
        _firstTouch = YES;
        _imageView.frame = _oldFrame;

    }
    
    NSUInteger number =scrollView.contentOffset.x/kScreeWidth+1;
    if (number == 0) {
        return;
    }
    //计算滑动到第几页
    self.numberOfimageArray.text = [NSString stringWithFormat:@"%lu/%lu",(unsigned long)number,(unsigned long)_imageRuls.count];
    
}
//图片放大缩小
-(void)scaGesture:(UIPinchGestureRecognizer *)sender {
    [self.view bringSubviewToFront:[(UIPinchGestureRecognizer*)sender view]];
    _imageView = (UIImageView *)[(UIPinchGestureRecognizer*)sender view];
    self.mySV.scrollEnabled = NO;
    if (_firstTouch == YES) {
        
        _firstTouch = NO;
        _oldFrame = _imageView.frame;
    }
    
    //当手指离开屏幕时,将lastscale设置为1.0,将UIScrollView设置为可以滑动
    if ([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        lastScale = 1.0;
        self.mySV.scrollEnabled = YES;
        return;
    }
    
    //放大缩小
    CGFloat scale = 1.0 - (lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    CGAffineTransform currentTransform = [(UIPinchGestureRecognizer*)sender view].transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [_imageView setTransform:newTransform];

    lastScale = [(UIPinchGestureRecognizer*)sender scale];
   
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return ![gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}
@end
