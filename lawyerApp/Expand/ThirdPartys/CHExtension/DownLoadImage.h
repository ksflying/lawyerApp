//
//  DownLoadImage.h
//  textImageCache
//
//  Created by mdhj－2 on 15/11/6.
//  Copyright © 2015年 mdhj－2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownLoadImage : NSObject

+ (void)downLoadImageWithUrlString:(NSString *)aUrlString completionHandler:(void (^)(NSData *data, NSURLResponse * response, NSError *error))aCompletionHandler;

@end
