//
//  ViewController.m
//  RGCardText
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#define TAG 99
#define TextColer ([UIColor colorWithRed:1.000 green:0.775 blue:0.351 alpha:1.000])

#import "RGCollectionViewCell.h"
#import "RGCardViewLayout.h"
#import "OTRAlbumDetailsViewController.h"
#import "OTRAlbumModel.h"
#import "OTRAlbumItemModel.h"
#import "ASRequest.h"
#import "UIImageView+WebCache.h"
#define cellRGCollectionView @"cellRGCollectionView"

//相册详情url
#define kALBUMITEM_URL @"http://dili.bdatu.com/jiekou/albums/a%@.html"





@interface OTRAlbumDetailsViewController ()<UICollectionViewDataSource>
@end

@implementation OTRAlbumDetailsViewController
{
    
    UICollectionView * _collectionView;
     NSMutableArray *_pictures;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:self.album.title];
    //创建布局
    RGCardViewLayout * flowLayout = [[RGCardViewLayout alloc] init];
    
    //实例化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:kScreen_Bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor=[UIColor clearColor];
    UIImageView *backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_4.png"]];
    backgroundView.frame=self.view.frame;

    [self.view addSubview:backgroundView];
    //指定数据源代理
    _collectionView.dataSource = self;
    //设置页模式
    _collectionView.pagingEnabled=YES;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[RGCollectionViewCell class] forCellWithReuseIdentifier:cellRGCollectionView];
    
    [self createData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) createData
{
    _pictures=[[NSMutableArray alloc]init];
    NSString *url=[NSString stringWithFormat:kALBUMITEM_URL,self.album.id];
    [self requestDataWithUrl:url];
    
}
-(void) requestDataWithUrl:(NSString *)url
{

    
    [ASRequest requestByGetWithUrl:url Complete:^(id object) {
        NSArray *array=object[@"picture"];
        _pictures=[OTRAlbumItemModel arrayOfModelsFromDictionaries:array];
        [_collectionView reloadData];
    } faile:^(NSError *error) {
        ;
    }];

}
#pragma mark <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _pictures.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RGCollectionViewCell *cell = (RGCollectionViewCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:cellRGCollectionView forIndexPath:indexPath];

    if(_pictures.count>indexPath.section)
    {
        OTRAlbumItemModel *albumItem=_pictures[indexPath.section];
        
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:albumItem.url] placeholderImage:[UIImage imageNamed:@"placeholderImage001"]];
        cell.mainLabel.text=albumItem.title;
        
        NSString *albumItemContent=[NSString stringWithFormat:@"%@ (摄影 : %@)",albumItem.content,albumItem.author];
        
        cell.mainTextView.text = albumItemContent;
    }
    
    return cell;
}



@end
