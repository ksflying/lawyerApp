

#import "TitleLabel.h"

@implementation TitleLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:16];
        self.scale = 0.0;
    }
    return self;
}

/** 通过scale的改变改变多种参数 */
- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    
//    self.textColor = [UIColor colorWithRed:scale green:107.0/255 blue:172.0/255 alpha:1];
    

    
    if (scale == 0) {
        self.textColor = [UIColor grayColor];
    }else if(scale == 1){
        self.textColor = [UIColor colorWithRed:8.0/255 green:107.0/255 blue:172.0/255 alpha:1];
    }else{
            self.textColor = [UIColor colorWithRed: (1 - scale) * 0.03 + 0.02 green:(1 - scale) * 0.25 + 0.2  blue:(1 - scale) * 0.15 + 0.5  alpha:1];
    }
    
    
//    NSLog(@"%f",scale);
    
    CGFloat minScale = 0.9;
    CGFloat trueScale = minScale + (1-minScale)*scale;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}

@end
