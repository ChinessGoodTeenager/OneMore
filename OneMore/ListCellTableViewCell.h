//
//  ListCellTableViewCell.h
//  OneMore
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryModel.h"

@interface ListCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (nonatomic,strong) HitoryResult *model;

@end
