//
//  OTRAlbumViewController.m
//  OTRDailySelection
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "OTRAlbumViewController.h"
#import "OTRAlbumModel.h"
#import "OTRAlbumCell.h"
#import "ASRequest.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "OTRAlbumDetailsViewController.h"

#define cellOTRAlbumViewController @"cellOTRAlbumViewController"



//相册首页 p表示页数
#define kALBUM_URL @"http://dili.bdatu.com/jiekou/mains/p%ld.html"

@interface OTRAlbumViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation OTRAlbumViewController
{
    UICollectionView * _collectionView;
    NSMutableArray *_Albums;
    NSInteger _page;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"每日精选"];
    
    [self createUI];
    
    
    [self createData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) createData
{
    _Albums=[[NSMutableArray alloc]init];
    _page=1;
    
    [self requestDataWithUrl:[NSString stringWithFormat:kALBUM_URL,(long)_page]];
    
}
-(void) createUI
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    

    //每一个cell大小
    flowLayout.itemSize = CGSizeMake(240, 180);
    
    //cell间的最小间距
    flowLayout.minimumInteritemSpacing = 60;
    
     flowLayout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 60);
    flowLayout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 40);
    //实例化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreeWidth, kScreeHeight) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;//指定数据源代理
    _collectionView.delegate = self;//设定代理
 
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_3.jpeg"]];
    
    
    // Register cell classes
    [_collectionView registerClass:[OTRAlbumCell class] forCellWithReuseIdentifier:cellOTRAlbumViewController];
    
    //注册section的footerView
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    
    NSLog(@"%@ %@ ",NSStringFromCGRect(_collectionView.header.frame),NSStringFromCGRect(_collectionView.frame));
    
    //上拉刷新
    _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_Albums removeAllObjects];
        _page=1;
        [self requestDataWithUrl:[NSString stringWithFormat:kALBUM_URL,(long)_page]];
    }];
    //下拉加载
    _collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        _page++;
    [self requestDataWithUrl:[NSString stringWithFormat:kALBUM_URL,(long)_page]];
    
    }];
}

-(void) requestDataWithUrl:(NSString *)url
{
    
    [ASRequest requestByGetWithUrl:url Complete:^(id object) {
        
        
        NSMutableArray *array=[OTRAlbumModel arrayOfModelsFromDictionaries:object[@"album"]];
        
        [_Albums addObjectsFromArray:array];
        
        [_collectionView.header endRefreshing];
        [_collectionView.footer endRefreshing];
        [_collectionView reloadData];
        
    } faile:^(NSError *error) {
        ;
    }];
    

}
#pragma mark <UICollectionViewDataSource>



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _Albums.count;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OTRAlbumCell *cell = (OTRAlbumCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellOTRAlbumViewController forIndexPath:indexPath];
    if (_Albums.count>indexPath.section) {
        OTRAlbumModel *album=_Albums[indexPath.section];

        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:album.url] placeholderImage:[UIImage imageNamed:@"placeholderImage002"]];
        cell.mainLabel.text = album.title;
    }

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionReusableView * footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
    UIImageView *line=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line001.png"]];
    line.frame=CGRectMake(0, 0, footView.frame.size.width, 30);
    //footView.backgroundColor = [UIColor blueColor];
    [footView addSubview:line];
    return footView;
}



#pragma mark <UICollectionViewDelegate>
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    OTRAlbumDetailsViewController *albumDetails=[[OTRAlbumDetailsViewController alloc]init];
    albumDetails.album=_Albums[indexPath.section];
    [self.navigationController pushViewController:albumDetails animated:YES];

    
}


@end
