//
//  CustomTabBarController.m
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HappyController.h"
#import "HistoryController.h"
#import "MovieController.h"
#import "NewsController.h"
#import "HappyBaseController.h"
@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createController];
    
}

#pragma mark ---创建视图
-(void)createController{
    //==============趣图==============
//    HappyController *happy = [[HappyController alloc]init];
//    happy.title = @"每日一笑";
//    UINavigationController *navhappy = [[UINavigationController alloc]initWithRootViewController:happy];
//    [navhappy.tabBarItem setImage:[UIImage imageNamed:@"kaixin_32"]];
//    [navhappy.tabBarItem setSelectedImage:[UIImage imageNamed:@"kaixin_32"]];
//    navhappy.tabBarItem.title = @"趣图";
    
     HappyBaseController *happy = [[HappyBaseController alloc]init];
    happy.title = @"每日一笑";
    UINavigationController *navhappy = [[UINavigationController alloc]initWithRootViewController:happy];
//    happy.navigationItem.backBarButtonItem.title = @"返回";
    [navhappy.tabBarItem setImage:[UIImage imageNamed:@"kaixin_32"]];
    [navhappy.tabBarItem setSelectedImage:[UIImage imageNamed:@"kaixin_32"]];
    navhappy.tabBarItem.title = @"趣图";

    
    //=============历史==========
    HistoryController *history = [[HistoryController alloc]init];
    history.title = @"那年今日";
    UINavigationController *navhistor = [[UINavigationController alloc]initWithRootViewController:history];
    [navhistor.tabBarItem setImage:[UIImage imageNamed:@"lishi_32"]];
    [navhistor.tabBarItem setSelectedImage:[UIImage imageNamed:@"lishi_32"]];
    navhistor.tabBarItem.title = @"历史";
    
    //===========电影===========
    MovieController *movie = [[MovieController alloc]init];
    movie.title = @"电影票房";
    UINavigationController *navmovie = [[UINavigationController alloc]initWithRootViewController:movie];
    [navmovie.tabBarItem setImage:[UIImage imageNamed:@"dianying_32"]];
    [navmovie.tabBarItem setSelectedImage:[UIImage imageNamed:@"dianying_32"]];
    navmovie.tabBarItem.title = @"电影";
    
    //=======新闻============
    NewsController *news = [[NewsController alloc]init];
    news.title = @"各国小报";
    UINavigationController *navnews = [[UINavigationController alloc]initWithRootViewController:news];
    [navnews.tabBarItem setImage:[UIImage imageNamed:@"jintian_32"]];
    [navnews.tabBarItem setSelectedImage:[UIImage imageNamed:@"jintian_32"]];
    navnews.tabBarItem.title = @"新闻";
    self.viewControllers = @[navhappy,navhistor,navnews,navmovie];
    
    
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
