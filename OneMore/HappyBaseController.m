//
//  HappyBaseController.m
//  OneMore
//
//  Created by apple on 16/5/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HappyBaseController.h"
#import "FunChooseCell.h"
#import "HappyController.h"
@interface HappyBaseController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HappyBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

-(void)createUI{

    
    self.baseTabView.frame = self.view.bounds;
    self.baseTabView.dataSource = self;
    self.baseTabView.delegate = self;
    
    [self.baseTabView registerNib:[UINib nibWithNibName:@"FunChooseCell" bundle:nil] forCellReuseIdentifier:@"chooseCell"];
    
    [self.view addSubview:self.baseTabView];
    NSLog(@"%@",self.baseTabView);
}


#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FunChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chooseCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.chooseImage.image = [UIImage imageNamed:@"jiongtu.jpg"];
        
        cell.chooseContent.text = @"囧图";
    }else{
    
        cell.chooseImage.image = [UIImage imageNamed:@"qiuwen.jpg"];
        
        cell.chooseContent.text = @"糗闻";

    }
    
    return cell;
}


#pragma mark -UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.view.bounds.size.height/2-40;
}
//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    NSLog(@"indexpath%ld",indexPath.row);
    if (indexPath.row ==0) {
        HappyController *happyController = [[HappyController alloc]init];
        happyController.title = @"囧图";
//        happyController.navigationItem.backBarButtonItem;
        
        happyController.navigationController.navigationItem.backBarButtonItem.title = @"返回";
//        [happyController.navigationItem.leftBarButtonItem setTitle:@"返回"];
//        happyController.navigationItem.leftBarButtonItem. = @"返回";
        //====
        happyController.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:happyController animated:YES];
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
