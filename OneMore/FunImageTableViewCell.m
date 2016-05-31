//
//  FunImageTableViewCell.m
//  OneMore
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FunImageTableViewCell.h"

@implementation FunImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setHappDataModel:(HappyData *)happDataModel{
     _happDataModel = happDataModel;
    [_happyImage setContentMode:UIViewContentModeScaleAspectFit];
    [_happyImage sd_setImageWithURL:[NSURL URLWithString:_happDataModel.url]  placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    self.happContent.text = _happDataModel.content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
