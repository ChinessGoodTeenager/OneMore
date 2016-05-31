//
//  ListViewController.h
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"

@interface ListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSString * requestURL; // 请求数据地址
@property(nonatomic,copy) NSString *parametersString;

@end
