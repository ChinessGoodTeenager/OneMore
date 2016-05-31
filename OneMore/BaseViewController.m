//
//  BaseViewController.m
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"
#import "AFNetworking.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"%@",swipe);
    
    
}


-(AFHTTPSessionManager *)httpManager{

    if (_httpManager == nil) {
        _httpManager = [AFHTTPSessionManager manager];
        _httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _httpManager.responseSerializer.acceptableContentTypes = [_httpManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
    }
    
    return _httpManager;
}

-(UITableView *)baseTabView{

    
    if (_baseTabView==nil) {
        _baseTabView = [[UITableView alloc]init];
//        [_baseTabView addGestureRecognizer:self.down];
        
    }
    
    return _baseTabView;
}

-(UISwipeGestureRecognizer *)swipeLeft{

    if (!_swipeLeft) {
        
        
        _swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
        [_swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];

        NSLog(@"滑动%@",_swipeLeft);
        
    }
    return _swipeLeft;
}


-(void)swipe:(UISwipeGestureRecognizer *)sw{
    NSLog(@"%@",sw);
    
    if (sw.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"-------------下滑");
            }
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
