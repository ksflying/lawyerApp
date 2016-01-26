//
//  TYGSelectMenu.m
//  TYGSelectMenu
//
//  Created by tanyugang on 15/7/6.
//  Copyright (c) 2015年 tanyugang. All rights reserved.
//

#import "TYGSelectMenu.h"
#import "TYGSelectMenuCellTableViewCell.h"
#import "TYGSelectContstant.h"
#import "ASButton.h"
#define RootViewControllerView ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])

#define MainFrame [[UIScreen mainScreen] bounds]
#define SystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]

@implementation TYGSelectMenu{
    NSInteger totalLevel;//总级别
    UIView *mainView;
    UIView *bottomView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        totalLevel = 1;
        self.menuArray = [NSMutableArray arrayWithCapacity:10];
        self.selectedMneuArray = [NSMutableArray arrayWithCapacity:10];
        
        self.titleFont = [UIFont systemFontOfSize:15];
        self.textAlignment = NSTextAlignmentLeft;
        self.maxWidth = CGRectGetWidth(MainFrame);
        self.maxHeight = CGRectGetHeight(MainFrame);
    }
    return self;
}

/**
 *  添加目录
 *  @param childMenu  添加的目录
 *  @param parentMenu 父级目录，当父级目录为nil时，为一级目录
 */
- (void)addChildSelectMenu:(TYGSelectMenuEntity *)childMenu forParent:(TYGSelectMenuEntity *)parentMenu{
    
    if (nil == childMenu) {
        return;
    }
    
    if (nil == parentMenu) {
        //一级目录
        childMenu.level = 1;
        childMenu.id = self.menuArray.count;
        [self.menuArray addObject:childMenu];
    }
    else{
        
        childMenu.level = parentMenu.level + 1;
        childMenu.parentMenu = parentMenu;
        childMenu.id = parentMenu.childMenuArray.count;
        
        [parentMenu.childMenuArray addObject:childMenu];
        
        totalLevel = MAX(totalLevel, childMenu.level);
    }
}


/**
 *  删除目录
 *  @param menu 要删除的目录，如果还有子目录，子目录也会一并删除
 */
- (void)removeMenu:(TYGSelectMenuEntity *)menu{
    
    if (nil == menu) {
        return;
    }

    for (int i = 0; i < self.menuArray.count; i++) {
        TYGSelectMenuEntity *tempMenu = [self.menuArray objectAtIndex:i];
        if (menu.id == tempMenu.id) {
            [self.menuArray removeObjectAtIndex:i];
        }
        else{
            while (tempMenu && tempMenu.childMenuArray.count > 0) {
                for (int j = 0; j < tempMenu.childMenuArray.count; j++) {
                    TYGSelectMenuEntity *temp2 = [tempMenu.childMenuArray objectAtIndex:j];
                    if (menu.id == temp2.id) {
                        [tempMenu.childMenuArray removeObjectAtIndex:j];
                    }
                }
            }
        }
    }
    
    
    //获取现在的总级数
    totalLevel = 1;
    for (int i = 0; i < self.menuArray.count; i++) {
        TYGSelectMenuEntity *tempMenu = [self.menuArray objectAtIndex:i];
        while (tempMenu && tempMenu.childMenuArray.count > 0) {
            for (int j = 0; j < tempMenu.childMenuArray.count; j++) {
                TYGSelectMenuEntity *temp2 = [tempMenu.childMenuArray objectAtIndex:j];
                totalLevel = MAX(totalLevel, temp2.level);
            }
        }
    }
}


/**
 *  显示
 *  @param view 要显示的视图（如：一个按钮）
 */
- (void)showFromView:(UIButton *)sender{
    
    
    
    //初始化视图
    CGRect rc = [sender convertRect:sender.frame toView:RootViewControllerView];

    CGFloat menuX = 0;
    CGFloat menuY = (CGRectGetMaxY(rc)+sender.frame.size.height)/2;
    CGFloat menuW = CGRectGetWidth(MainFrame) - menuX;
    CGFloat menuH = CGRectGetHeight(MainFrame)/2;
    
    menuW = MIN(menuW, self.maxWidth);
    menuH = MIN(menuH, self.maxHeight);
    
    // 判断 蒙板 存不存在 不存在的话创建
    if (bottomView) {
        [self hideBottomView];
    }else{
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        bottomView =[[UIView alloc]initWithFrame:CGRectMake(menuX, menuY,[UIScreen mainScreen].bounds.size.width,height)];
        bottomView.backgroundColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:0.3];
        UITapGestureRecognizer *tapDimissMenu = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideBottomView)];
        [bottomView addGestureRecognizer:tapDimissMenu];
        
        [RootViewControllerView addSubview:bottomView];
    }
    
    
    if (mainView) {
        [self disMiss];
    }
    else{
        //初始化数据
        if (self.selectedMneuArray.count == 0) {
            
            TYGSelectMenuEntity *tempMenu = [self.menuArray firstObject];
            [self.selectedMneuArray addObject:tempMenu];
            
            BOOL canNext = YES;
            while (canNext) {
                tempMenu = [tempMenu.childMenuArray firstObject];
                if (tempMenu) {
                    [self.selectedMneuArray addObject:tempMenu];
                }
                else{
                    canNext = NO;
                }
            }
        }
        
        CGRect mainViewFrame = CGRectMake(menuX, menuY, menuW, menuH);
        [self drawShowViewWithFrame:mainViewFrame];
        mainView.backgroundColor = [UIColor lightGrayColor];
        
        mainView.frame = CGRectMake(menuX, menuY, menuW, 0);
        [UIView animateWithDuration:0.24 animations:^{
            
            mainView.frame = mainViewFrame;
            [RootViewControllerView addSubview:mainView];
            
            
        } completion:^(BOOL finished) {
            
        }];
    }
 
}

- (void)hideBottomView{
    if (bottomView) {
        bottomView.frame = CGRectMake(0, 108,[UIScreen mainScreen].bounds.size.width,0);
        [bottomView removeFromSuperview];
        bottomView = nil;
        [self.menuButton setTitleColor:NormalMenuBackgroundColor forState:(UIControlStateNormal)];
   
    }
    [self disMiss];
}


/**
 *  绘制目录视图
 */
- (UIView *)drawShowViewWithFrame:(CGRect)frame{
    
    if (nil == mainView) {
        mainView = [[UIView alloc] initWithFrame:frame];
        mainView.backgroundColor = [UIColor whiteColor];
        mainView.clipsToBounds = YES;
    }
    else{
        for (UIView *tempView in mainView.subviews) {
            [tempView removeFromSuperview];
        }
    }
    
    CGFloat scrollOffset_v = 1;
    CGFloat scrollOffset_h = 1;

    CGFloat scrollX = 0;
    CGFloat scrollY = scrollOffset_v;
    CGFloat scrollW = (CGRectGetWidth(mainView.frame) + scrollOffset_h)/totalLevel - scrollOffset_h;
    CGFloat scrollH = (CGRectGetHeight(mainView.frame) - scrollY);
    
    for (int i = 0; i < totalLevel; i ++) {
        //滚动视图
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(scrollX, scrollY, scrollW, scrollH) style:UITableViewStylePlain];
        tableView.tag = i;
        tableView.delegate = self;
        tableView.dataSource = self;
//        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.bounces = NO;
//        if (tableView.tag == 0) {
//            tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//        }
        
        if (SystemVersion >= 7.0) {
            tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
        
        [mainView addSubview:tableView];
        tableView.backgroundColor = [UIColor whiteColor];

        scrollX = CGRectGetMaxX(tableView.frame) + scrollOffset_h;
    }
    
    return mainView;
}

/**
 *  隐藏
 */
- (void)disMiss{
    
    if (mainView) {
        
        CGRect mainViewFrame = mainView.frame;
        mainViewFrame.size.height = 0;
        
        [UIView animateWithDuration:0.1 animations:^{
            mainView.frame = mainViewFrame;
        } completion:^(BOOL finished) {
            [mainView removeFromSuperview];
            mainView = nil;
        }];
    }
}

/**
 *  选中目录事件
 *  @param selectedMenu 选中的目录
 */
- (void)selectAtMenu:(void(^)(NSMutableArray *selectedMenuArray))selectedMenu2{
    selectedMenu = selectedMenu2;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSInteger num = 0;
    
    if (tableView.style == UITableViewStylePlain) {
        num = 1;
    }
    else{
        NSInteger tableLevel = tableView.tag;
        for (int i = 0; i < self.selectedMneuArray.count; i ++) {
            if (tableLevel == i) {
                if (i == 0) {
                    num = self.menuArray.count;
                }
                else{
                    TYGSelectMenuEntity *parMenu = [self.selectedMneuArray objectAtIndex:i-1];
                    num = parMenu.childMenuArray.count;
                }
            }
        }
    }

    return num;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger num = 0;
    
    if (tableView.style == UITableViewStylePlain) {
        NSInteger tableLevel = tableView.tag;
        for (int i = 0; i < self.selectedMneuArray.count; i ++) {
            if (tableLevel == i) {
                if (i == 0) {
                    num = self.menuArray.count;
                }
                else{
                    TYGSelectMenuEntity *parMenu = [self.selectedMneuArray objectAtIndex:i-1];
                    num = parMenu.childMenuArray.count;
                }
            }
        }
        
    }
    else{
        num = 1;
    }
    
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *reuseIdetify = @"TYGSelectMenuCellTableViewCell";
    TYGSelectMenuCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    if (nil == cell) {
        UINib *nib = [UINib nibWithNibName:@"TYGSelectMenuCellTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:reuseIdetify];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
       
//        if (tableLevel == 0) {
//            cell.bg_mainView.backgroundColor = [UIColor lightGrayColor];
//        }
    }
    
    //获取数据
    TYGSelectMenuEntity *tempMenu = nil;
    NSInteger tableLevel = tableView.tag;
    for (int i = 0; i < self.selectedMneuArray.count; i ++) {

        if (tableLevel == i) {
            if (i == 0) {
                tempMenu = [self.menuArray objectAtIndex:indexPath.row];
            }
            else{
                TYGSelectMenuEntity *parMenu = [self.selectedMneuArray objectAtIndex:i-1];
                tempMenu = [parMenu.childMenuArray objectAtIndex:indexPath.row];
            }
        }
        
    }
    
    //选中的数据
    TYGSelectMenuEntity *tempActionMenu = [self.selectedMneuArray objectAtIndex:tableLevel];
    
    cell.grade = tableLevel;

    //显示数据
    if (tempActionMenu.id == tempMenu.id) {
        cell.isSelected = YES;
    }
    else{
        cell.isSelected = NO;
    }
    
    cell.titleLabel.text = tempMenu.title;


    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 33;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(tableView.tag == 0){
        return 33;
    }else if (tableView.tag == 1){
        return 1;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSInteger height = 33.0;
    UIView *sectionView = [[UIView alloc] init];
    sectionView.backgroundColor = [UIColor colorWithRed:246.0 / 255.0 green:246.0 / 255.0  blue:246.0 / 255.0  alpha:1];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSectionView)];
    [sectionView addGestureRecognizer:tap];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, height)];
    
    if (tableView.tag == 0) {
        titleLabel.text = self.sectionTitle1;
    }else if (tableView.tag == 1){
        titleLabel.text = self.sectionTitle2;
    }
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [sectionView addSubview:titleLabel];
    
    return sectionView;
}

- (void)tapSectionView{
    
    if (self.selectSectionView) {
        self.selectSectionView();
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取选中的节点
    TYGSelectMenuEntity *tempMenu = nil;
    NSInteger tableLevel = tableView.tag;
    for (int i = 0; i < self.selectedMneuArray.count; i ++) {
        if (tableLevel == i) {
            if (i == 0) {
                tempMenu = [self.menuArray objectAtIndex:indexPath.row];
            }
            else{
                TYGSelectMenuEntity *parMenu = [self.selectedMneuArray objectAtIndex:i-1];
                tempMenu = [parMenu.childMenuArray objectAtIndex:indexPath.row];
            }
        }
    }
    
    [self.selectedMneuArray replaceObjectAtIndex:tableLevel withObject:tempMenu];
    [tableView reloadData];

    //刷新选中的节点的子节点
    if (tempMenu && tempMenu.childMenuArray.count > 0) {
        
        while (tempMenu && tempMenu.childMenuArray.count > 0) {
            
            tempMenu = [tempMenu.childMenuArray firstObject];
            [self.selectedMneuArray replaceObjectAtIndex:tableLevel+1 withObject:tempMenu];
            
            UITableView *tempTable = (UITableView *)[mainView viewWithTag:tableLevel + 1];
            if (tempTable) {
                [tempTable reloadData];
            }
            tableLevel++;
        }
        
    }
    else{
        if (selectedMenu) {
            selectedMenu(self.selectedMneuArray);
            [self hideBottomView];
//            [self disMiss];
        }
    }
}

@end
