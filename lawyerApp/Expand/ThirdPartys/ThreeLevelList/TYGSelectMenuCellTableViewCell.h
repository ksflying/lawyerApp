//
//  TYGSelectMenuCellTableViewCell.h
//  TYGSelectMenu
//
//  Created by tanyugang on 15/7/7.
//  Copyright (c) 2015年 tanyugang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYGSelectMenuCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,assign) BOOL isSelected;
@property (nonatomic,assign) NSInteger grade;
@property (weak, nonatomic) IBOutlet UIView *bg_mainView;


@end
