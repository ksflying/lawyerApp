//
//  LocalDataHelpManager.m
//  demo
//
//  Created by mdhj－2 on 15/11/4.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import "LocalDataHelpManager.h"


@implementation LocalDataHelpManager

//报漏在外面的接口  写入数据   aPath 路径  aDateName 文件名字 aDate  要保存的 dictonary 的 实例

//读取本地收藏列表
+ (NSArray *)readLocalMyCollectionList{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"MyCollection.plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    return array;
}

//保存本地收藏列表
+ (void)waitLocalMyCollectionListWithArray:(NSArray *)listArray{
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"MyCollection.plist"];
    if ([listArray writeToFile:filename atomically:YES]) {
        
    }else{
        
    }
}

//判断本地文件是否存在
+ (BOOL)isExistsFile:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
    
    if(path==NULL)
        return NO;
    else
        return YES;
}

//+ (void)myCol{
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"plistdemo" ofType:@"plist"];
//    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
//    NSLog(@"%@", array);
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name",@"heqinsdfg",@"age",@"23",nil];
//    //    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    //    [dic setObject:@"heqing" forKey:@"name"];
//    //     [dic setObject:@"23" forKey:@"age"];
//    //添加一项内容
//    [array addObject:dic];
//    
//    
//    //获取应用程序沙盒的Documents目录
//    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//    NSString *plistPath1 = [paths objectAtIndex:0];
//    
//    //得到完整的文件名
//    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"test.plist"];
//    //输入写入
//    if ([array writeToFile:filename atomically:YES]) {
//        NSLog(@"成功");
//    }else{
//        NSLog(@"失败");
//    }
//    
//    //那怎么证明我的数据写入了呢？读出来看看
//    NSMutableArray *arraya = [[NSMutableArray alloc] initWithContentsOfFile:filename];
//    NSLog(@"%@", arraya);
//    
//    
//}




//将下载的图片存储到沙盒中
+ (void)saveDownloadImage:(UIImage *)image filePath:(NSString *)aPath
{
    
    //获取路径
    NSString *cache = [self dirCache];
    NSString *localPath = [cache stringByAppendingString:aPath];
    //创建文件管理对象
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //判断是否存在
    BOOL isDir = NO;
    isDir = [fileManager fileExistsAtPath:localPath isDirectory:&isDir];
    if (!isDir) {
        //不存在就创建
        [self createDirWithPath:cache name:[aPath stringByReplacingOccurrencesOfString:@"/" withString:@""]];
    }
    
    
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    [data writeToFile:localPath atomically:YES];
}

+ (void)writeToLocalWithPatch:(NSString *)aPath dateName:(NSString *)aDateName data:(NSDictionary *)aData{
    //获取路径
    NSString *cache = [self dirCache];
    NSString *localPath = [cache stringByAppendingString:aPath];
    //创建文件管理对象
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //判断是否存在
    BOOL isDir = NO;
    isDir = [fileManager fileExistsAtPath:localPath isDirectory:&isDir];
    if (!isDir) {
        //不存在就创建
        [self createDirWithPath:cache name:[aPath stringByReplacingOccurrencesOfString:@"/" withString:@""]];
    }
    
    NSString *filePath = [localPath stringByAppendingPathComponent:[aDateName stringByAppendingString:@".txt"]];

    NSString *string = [NSString stringWithFormat:@"%@",aData];
    
    if ([string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil]) {
//        NSLog(@"成功");
    }else{
//        NSLog(@"失败");
    };
}

//取文件 这个用到了
+ (NSDictionary *)readToLocalwithPatch:(NSString *)aPath dateName:(NSString *)aDateName{
    
    NSString *cache = [self dirCache];
    NSString *localPath = [cache stringByAppendingString:aPath];
    NSString *filePath = [localPath stringByAppendingPathComponent:[aDateName stringByAppendingString:@".txt"]];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];

//    NSLog(@"%@",dic);
    return dic;
}
//删除文件
+ (void)deleteFileWithPath:(NSString *)aPath dataName:(NSString *)aDateName{
    NSString *cache =[self dirCache];
    
    NSString *localPath = [cache stringByAppendingString:aPath];
    
    NSString *filePath = [localPath stringByAppendingPathComponent:[aDateName stringByAppendingString:@".txt"]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL res= [fileManager removeItemAtPath:filePath error:nil];
//    if (res)
//       NSLog(@"文件删除成功");
//    else
//        NSLog(@"文件删除失败");
//    NSLog(@"文件是否存在: %@",[fileManager isExecutableFileAtPath:testPath]?@"YES":@"NO");
}

/////判断轮播图路径是否存在
//+ (BOOL)isExistsCarouselFigureFile:(NSString *)fileName{
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
//    
//    if(path==NULL)
//        return NO;
//    else
//        return YES;
//}

//获取Cache目录
+ (NSString *)dirCache{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
//    NSLog(@"app_home_lib_cache: %@",cachePath);
    return cachePath;
}

//写文件
+ (void)writeFile{
    NSString *documentsPath =[self dirCache];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    NSString *content=@"测试写入内容！";
    [content writeToFile:testPath atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

+ (void)writeFile1{
    
    NSArray  *paths  =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    if(!docDir) {
        
    }
    NSArray *array = [[NSArray alloc] initWithObjects:@"内容",@"content",nil];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
    [array writeToFile:filePath atomically:YES];
    
    
}

//创建文件夹 这个方法用到了
+ (void)createDirWithPath:(NSString *)aPath name:(NSString *)aName{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [aPath stringByAppendingPathComponent:aName];
    // 创建目录
//    BOOL res=
    [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
//    if (res) {
//        NSLog(@"文件夹创建成功");
//    }else{
//        NSLog(@"文件夹创建失败");
//    }
}

//读文件
+ (void)readFile{
    NSString *documentsPath =[self dirCache];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    //    NSData *data = [NSData dataWithContentsOfFile:testPath];
    //    NSLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *content=[NSString stringWithContentsOfFile:testPath encoding:NSUTF8StringEncoding error:nil];
   
}


+ (void)readFile1{
    
    NSArray  *paths  =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    
}


@end
