//
//  RGCollectionViewCell.m
//  RGCardViewLayout
//
//  Created by ROBERA GELETA on 1/23/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "RGCollectionViewCell.h"

@implementation RGCollectionViewCell


-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.contentView.frame.size.width, self.contentView.frame.size.height-20)];
        _imageView.userInteractionEnabled = YES;
        
        
        
        _mainLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.frame.origin.y+_imageView.frame.size.height+30, self.contentView.frame.size.width, 20)];
        _mainLabel.backgroundColor=[UIColor clearColor];
        _mainLabel.textColor=[UIColor whiteColor];
        
        
        _mainTextView=[[UITextView alloc] initWithFrame:CGRectMake(0, _mainLabel.frame.origin.y+_mainLabel.frame.size.height, self.contentView.frame.size.width, 40)];
        _mainTextView.font=[UIFont systemFontOfSize:13];
        _mainTextView.backgroundColor=[UIColor clearColor];
        _mainTextView.textColor=[UIColor whiteColor];
        _mainTextView.editable=NO;
        
        
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_mainTextView];
        [self.contentView addSubview:_mainLabel];
    }
    return self;
}

@end
