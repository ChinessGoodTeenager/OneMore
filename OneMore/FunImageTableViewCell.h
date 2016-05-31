//
//  FunImageTableViewCell.h
//  OneMore
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappyModel.h"
@interface FunImageTableViewCell : UITableViewCell

//@property (weak, nonatomic) IBOutlet UILabel *happyContent;
@property (weak, nonatomic) IBOutlet UIImageView *happyImage;
@property (weak, nonatomic) IBOutlet UILabel *happContent;
@property (nonatomic,strong)HappyData *happDataModel;
@end
