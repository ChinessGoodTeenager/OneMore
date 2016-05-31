//
//  BaseViewController.h
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) AFHTTPSessionManager * httpManager;

@property (nonatomic,strong) UITableView *baseTabView;

@property (nonatomic,strong) UISwipeGestureRecognizer *swipeLeft;


-(void)swipe:(UISwipeGestureRecognizer *)sw;
@end
