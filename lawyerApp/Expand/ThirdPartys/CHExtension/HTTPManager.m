//
//  HTTPManager.m
//  B_test
//
//  Created by 3g on 15/9/18.
//  Copyright (c) 2015年 chehao. All rights reserved.
//

#import "HTTPManager.h"


@implementation HTTPManager

+ (instancetype)manager
{
    HTTPManager *mgr = [super manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];

    return mgr;
}



@end
