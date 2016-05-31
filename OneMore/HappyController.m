//
//  HappyController.m
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HappyController.h"

@interface HappyController ()
@end

@implementation HappyController

- (void)viewDidLoad {
    
    self.requestPageSize = 10;
    self.requestPage = 0;
    self.requestURL = happURL;
    
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
