//
//  OTRAlbumCell.m
//  OTRDailySelection
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "OTRAlbumCell.h"

@implementation OTRAlbumCell
-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, self.contentView.frame.size.width, self.contentView.frame.size.height-40)];
        _imageView.userInteractionEnabled = YES;
    
        _mainLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.frame.origin.y+_imageView.frame.size.height, self.contentView.frame.size.width, 40)];
        _mainLabel.backgroundColor=[UIColor clearColor];
        _mainLabel.textAlignment=NSTextAlignmentCenter;
        _mainLabel.textColor=[UIColor colorWithWhite:0.334 alpha:1.000];
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_mainLabel];
    }
    return self;
}
@end
