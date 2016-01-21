//
//  TYGSelectMenuCellTableViewCell.m
//  TYGSelectMenu
//
//  Created by tanyugang on 15/7/7.
//  Copyright (c) 2015年 tanyugang. All rights reserved.
//

#import "TYGSelectMenuCellTableViewCell.h"
#import "TYGSelectContstant.h"
@implementation TYGSelectMenuCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    
    if (_isSelected == YES) {
        
         [self.titleLabel setTextColor:[UIColor whiteColor]];
        self.bg_mainView.backgroundColor = CellSelectedBackgroundColor;
    }
    else{
        [self.titleLabel setTextColor:[UIColor blackColor]];
        if (self.grade > 0 )
        {
            self.bg_mainView.backgroundColor = LevelFirstCellBackgroundColor;
        }
        else
        {
            self.bg_mainView.backgroundColor = LevelSecondCellBackgroundColor;
        }
    }
}

@end
