//
//  RadioViewController2.m
//  demo
//
//  Created by apple  on 15/11/27.
//  Copyright © 2015年 apple . All rights reserved.
//

#import "RadioViewController2.h"
#import "ZYRadioButton.h"
#import "ASReadSetting.h"


#define submitBackgroungColor ([UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000])

#define weibaotiaojian @"weibaotiaojian"

#define MaintenanceConditionsTableViewControllercell @"MaintenanceConditionsTableViewControllercell"
@interface RadioViewController2 ()<RadioButtonDelegate>

@end
//weibaotiaojian
@implementation RadioViewController2
{
    NSMutableArray *_selectArray;
    NSMutableArray *_weibaotiaojian;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dataInit];
    [self uiInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dataInit
{
    
    
     _weibaotiaojian = [NSMutableArray arrayWithArray: [ASReadSetting readSettingPlist:weibaotiaojian]];
    _selectArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i<_weibaotiaojian.count; i++) {
        
        
        [_selectArray addObject:@"不符合"];
        //按照GroupId添加观察者
        NSString *groupId = [NSString stringWithFormat:@"%@%d",weibaotiaojian,i];
        [ZYRadioButton addObserverForGroupId:groupId observer:self];
        
    }

    
}

- (void) uiInit
{

    //取消多余分割线
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
}
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   return 2;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return _weibaotiaojian.count;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:MaintenanceConditionsTableViewControllercell];
    
    //自定义cell,往cell添加子视图
    
    
    if (indexPath.section ==1) {
        
        cell = [[UITableViewCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIButton *submit = [UIButton buttonWithType:(UIButtonTypeSystem)];
        submit.layer.cornerRadius = 5;
        
        [submit setTitle:@"提交" forState:(UIControlStateNormal)];
        submit.frame = CGRectMake(10, 10, kScreeWidth-20, 30);
        [submit setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [submit addTarget:self action:@selector(submitClcik:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell addSubview:submit];
        [submit setBackgroundColor:submitBackgroungColor];
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
        return cell;
    }
    if (cell==nil) {
        
        
        //cell = [[UITableViewCell alloc] init];
        
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:MaintenanceConditionsTableViewControllercell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //计算lable文字高度
        CGSize size = [_weibaotiaojian[indexPath.row] boundingRectWithSize:CGSizeMake(kScreeWidth-10, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
        
        UILabel *leftLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, size.width, size.height)];

        leftLable.font=[UIFont systemFontOfSize:13];
        [cell.contentView addSubview:leftLable];
        
        
        leftLable.text=_weibaotiaojian[indexPath.row];
        
        leftLable.numberOfLines  = 10;//不限制行
        leftLable.lineBreakMode = NSLineBreakByWordWrapping;
        for (int i = 0; i < 2; i++) {
            
            //初始化单选按钮控件
            NSString *groupId = [NSString stringWithFormat:@"weibaotiaojian%ld",(long)indexPath.row];
            ZYRadioButton *rb = [[ZYRadioButton alloc] initWithGroupId:groupId index:i];

            rb.frame = CGRectMake(10+i*((kScreeWidth-10)/2), leftLable.frame.origin.y+leftLable.frame.size.height, (kScreeWidth-10)/2, 50);
            [cell addSubview:rb];
            
            if ([_selectArray[indexPath.row] isEqualToString: @"不符合"]==YES &&i==1) {
                rb.button.selected=YES;
            }
            
            //初始化第i个单选按钮的UILabel
            
            rb.lable.frame= CGRectMake(rb.button.frame.origin.x+rb.button.frame.size.width, rb.button.frame.origin.y, rb.frame.size.width-rb.button.frame.size.width, rb.button.frame.size.height);
            rb.lable.backgroundColor = [UIColor clearColor];
            rb.lable.font=[UIFont systemFontOfSize:13];
            if (i==0) {
                rb.lable.text = @"符合";
            }
            else
            {
                rb.lable.text = @"不符合";
            }
        }
        
    }
    
    return cell;
}

-(void)submitClcik:(id) sender
{
    if (_mcResult) {
        _mcResult(_selectArray);

    }
    NSLog(@"选择结果%@",_selectArray);
    [self.navigationController popViewControllerAnimated:YES];
   
}

#pragma mark <UITableViewDelegate>
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //根据文字和字体计算文字高度
        NSString * str = _weibaotiaojian[indexPath.row];
        CGSize size = [str boundingRectWithSize:CGSizeMake(kScreeWidth-10, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
        return size.height + 50;
    }
    else
    {
        return 50;
    }
}
#pragma mark <RadioButtonDelegate>
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    //维保类型
    NSInteger groupIndex = [[groupId stringByReplacingOccurrencesOfString:weibaotiaojian withString:@""] integerValue];
    
    if (index == 0) {
        [_selectArray replaceObjectAtIndex:groupIndex withObject:@"符合"];
    }
    else
    {
        [_selectArray replaceObjectAtIndex:groupIndex withObject:@"不符合"];
    }
    
}
@end
