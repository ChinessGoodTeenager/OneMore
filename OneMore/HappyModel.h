//
//  HappyModel.h
//  OneMore
//
//  Created by apple on 16/5/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HappyResult,HappyData;
@interface HappyModel : NSObject<YYModel>


@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) HappyResult *result;

@property (nonatomic, copy) NSString *reason;


@end
@interface HappyResult : NSObject

@property (nonatomic, strong) NSArray<HappyData *> *data;

@end

@interface HappyData : NSObject

@property (nonatomic, assign) NSInteger unixtime;

@property (nonatomic, copy) NSString *updatetime;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *hashId;

@end

