//
//  OTRAlbumModel.h
//  text00001
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "JSONModel.h"
/*
 addtime = "2015-10-13 10:00:24";
 adshow = NO;
 amd5 = 27fe0555fd9d3614308525ae26aa3520;
 ds = 1;
 encoded = 1;
 fabu = YES;
 id = 982;
 sort = 980;
 title = "2015-10-13\U6bcf\U65e5\U7cbe\U9009";
 url = "http://pic01.bdatu.com/Upload/appsimg/1444621831.png";
 */
@interface OTRAlbumModel : JSONModel
@property(nonatomic,copy) NSString *addtime;//添加时间
@property(nonatomic,copy) NSString *adshow;//
@property(nonatomic,copy) NSString *amd5;//校验码
@property(nonatomic,copy) NSString *ds;
@property(nonatomic,copy) NSString *fabu;//是否发布
@property(nonatomic,copy) NSString *id;//相册id
@property(nonatomic,copy) NSString *sort;
@property(nonatomic,copy) NSString *title;//相册标题
@property(nonatomic,copy) NSString *url;//相册封面图片URL
@end
