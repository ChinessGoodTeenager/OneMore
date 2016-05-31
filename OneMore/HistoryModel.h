//
//  HistoryModel.h
//  OneMore
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HitoryResult;
@interface HistoryModel : NSObject<YYModel>


@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) NSArray<HitoryResult *> *result;

@property (nonatomic, copy) NSString *reason;


@end
@interface HitoryResult : NSObject

@property (nonatomic, copy) NSString *e_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *day;

@property (nonatomic, copy) NSString *date;

@end

