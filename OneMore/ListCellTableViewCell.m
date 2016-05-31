//
//  ListCellTableViewCell.m
//  OneMore
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ListCellTableViewCell.h"

@implementation ListCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(HitoryResult *)model{

    _model = model;
    self.title.text = _model.title;
}

@end
