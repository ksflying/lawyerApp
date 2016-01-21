//
//  DownLoadImage.m
//  textImageCache
//
//  Created by mdhj－2 on 15/11/6.
//  Copyright © 2015年 mdhj－2. All rights reserved.
//

#import "DownLoadImage.h"

@implementation DownLoadImage

+ (void)downLoadImageWithUrlString:(NSString *)aUrlString completionHandler:(void (^)(NSData *data, NSURLResponse * response, NSError *error))aCompletionHandler{

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:aUrlString]];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    //ephemeralSessionConfiguration不使用缓存
//    var sessionConfiguration:NSURLSessionConfiguration = NSURLSessionConfiguration.ephemeralSessionConfiguration();
    //        sessionConfiguration.networkServiceType = NSURLRequestNetworkServiceType.NetworkServiceTypeDefault;
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *sesionDataTase = [session dataTaskWithRequest:request completionHandler:aCompletionHandler];
    
    [sesionDataTase resume];
//    var session:NSURLSession = NSURLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil);
//    var sessionDataTask:NSURLSessionDataTask = session.dataTaskWithRequest(request);
    //        var sessionDataTask:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: { (NSData, NSURLResponse, NSError) -> Void in
    //            self.audio = AVAudioPlayer(data: NSData, error: nil);
    //            self.audio.volume = 0.8;
    //            self.audio.prepareToPlay();
    //            self.audio.play();
    //        });
//    sessionDataTask.resume();

    
    
    
}

@end
