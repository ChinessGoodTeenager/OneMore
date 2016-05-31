//
//  HappListController.h
//  OneMore
//
//  Created by apple on 16/5/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"

@interface HappListController : BaseViewController
@property (nonatomic, copy) NSString * requestURL; // 请求数据地址
@property (nonatomic, assign) NSInteger requestPage;
@property (nonatomic, assign) NSInteger requestPageSize;


@end
