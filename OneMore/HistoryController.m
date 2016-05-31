//
//  HistoryController.m
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HistoryController.h"

@interface HistoryController ()

@end

@implementation HistoryController

- (void)viewDidLoad {
    //那年今日参数
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    // 设置日期格式
    [dateFormatter setDateFormat:@"M/d"];
    self.parametersString = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"%@",self.parametersString);
    self.requestURL = historyURL;
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
