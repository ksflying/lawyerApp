//
//  OTRAlbumItemModel.h
//  OTRDailySelection
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "JSONModel.h"
/*
 addtime = "2015-10-12 11:59:14";
 albumid = 982;
 author = "George Steinmetz";
 content = "\U4e00\U5c0f\U7fa4\U6cd5\U56fd\U89c2\U5149\U5ba2\U5728\U8305\U5229\U5854\U5c3c\U4e9a\U5883\U5185\U8ffd\U6eaf\U53e4\U4ee3\U9a86\U9a7c\U5546\U961f\U5f80\U6765\U5782\U6b7b\U7eff\U6d32\U57ce\U9547\U4e4b\U95f4\U7684\U8def\U7ebf\U3002https://instagram.com/thephotosociety/";
 copyright = "";
 encoded = 1;
 id = 7566;
 pmd5 = f917bfd240a69bd89b85a3d1465804f6;
 size = 298810;
 sort = 7566;
 thumb = "http://pic01.bdatu.com/Upload/picimg/1444622348.png";
 title = "\U7eff\U6d32\U57ce\U9547\U4e4b\U95f4";
 type = pic;
 url = "http://pic01.bdatu.com/Upload/picimg/1444622348.png";
 weburl = "http://";
 yourshotlink = "";
 */
@interface OTRAlbumItemModel : JSONModel
@property(nonatomic,copy) NSString *addtime;//添加时间
@property(nonatomic,copy) NSString *albumid;//相册id
@property(nonatomic,copy) NSString *author;//图片作者
@property(nonatomic,copy) NSString *content;//图片描述
@property(nonatomic,copy) NSString *copyright;
@property(nonatomic,copy) NSString *encoded;
@property(nonatomic,copy) NSString *id;//照片id
@property(nonatomic,copy) NSString *pmd5;
@property(nonatomic,copy) NSString *sort;
@property(nonatomic,copy) NSString *thumb;//照片地址
@property(nonatomic,copy) NSString *title;//照片title
@property(nonatomic,copy) NSString *type;
@property(nonatomic,copy) NSString *url;//照片地址
@property(nonatomic,copy) NSString *weburl;
@property(nonatomic,copy) NSString *yourshotlink;

@end
