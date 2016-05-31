//
//  HappListController.m
//  OneMore
//
//  Created by apple on 16/5/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HappListController.h"
#import "FunImageTableViewCell.h"
#import "HappyModel.h"
@interface HappListController ()<UITableViewDelegate,UITableViewDataSource>

//@property(nonatomic,strong) UITableView *happlist;
@property(nonatomic,strong) NSMutableArray *happListArray;

@end

@implementation HappListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self firstLoad];
//    [self requestListWithString:happURL page:self.requestPage pageSize:self.requestPageSize];
    // Do any additional setup after loading the view.
}


#pragma mark -懒加载
-(NSMutableArray *)happListArray{

    if (!_happListArray) {
        _happListArray = [NSMutableArray array];
    }
    return _happListArray;
}


-(void)createUI{
    
    self.baseTabView = [[UITableView alloc]init];
    self.baseTabView.frame = self.view.bounds;
    self.baseTabView.dataSource = self;
    self.baseTabView.delegate = self;
    [self.baseTabView registerNib:[UINib nibWithNibName:@"FunImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"funImageCell"];
    self.baseTabView.rowHeight = 200;
    
    
    
    // 添加下拉刷新和上拉加载
    __weak typeof (self) weakSelf = self;
    self.baseTabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSLog(@"%@",happURL);
        weakSelf.requestPage = 1;
        // 隐藏footer
        weakSelf.baseTabView.mj_footer.hidden = YES;
        [weakSelf requestListWithString:weakSelf.requestURL page:weakSelf.requestPage pageSize:10];
    }];
    
    self.baseTabView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.baseTabView.mj_header.hidden = YES;
        [weakSelf requestListWithString:weakSelf.requestURL page:++weakSelf.requestPage pageSize:weakSelf.requestPageSize];
    }];
    
    
    [self.view addSubview:self.baseTabView ];
}

//第一次请求数据
-(void)firstLoad{

    self.requestPage = 1;
    [self.self.baseTabView.mj_header beginRefreshing];
}


#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.happListArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"index========%@",indexPath);
    
    NSString *funImageCellID = @"funImageCell";
    
    FunImageTableViewCell *funcell = [tableView dequeueReusableCellWithIdentifier:funImageCellID forIndexPath:indexPath];
    HappyData *model = self.happListArray[indexPath.row];
    funcell.happDataModel = model;
    return funcell;
}


#pragma mark -准备数据
-(void)requestListWithString:(NSString *)string page:(NSInteger)page pageSize:(NSInteger)pageSize{
    // 百分号编码
       __weak typeof(self) weakSelf = self;
//    NSString *parametersURL = happURL;
    // 拼接URL地址
    NSString *url = [NSString stringWithFormat:string,page,pageSize];
    //百分号编码
    NSString *percentURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",percentURL);
    
    //网络请求
    [self.httpManager GET:percentURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //解析数据
        NSDictionary *happyDict = responseObject[@"result"];
        NSArray *happyArray = happyDict[@"data"];
        
        //创建模型数组
        NSArray *happyModelArray = [NSArray yy_modelArrayWithClass:[HappyData class] json:happyArray];
        
        // 判断是否为page=1，首次加载，下拉刷新
        if (page == 1) {
            // 移除数据源中所有数据
            [weakSelf.happListArray removeAllObjects];
        }
        //更新视图
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.self.baseTabView reloadData];
            // 更新Header和footer的状态
            [weakSelf.baseTabView.mj_header endRefreshing];
            [weakSelf.baseTabView.mj_footer endRefreshing];
            weakSelf.baseTabView.mj_header.hidden = NO;
            weakSelf.baseTabView.mj_footer.hidden = NO;

        });
        
        [weakSelf.happListArray addObjectsFromArray:happyModelArray];
        NSLog(@"happListArray %lu",weakSelf.happListArray.count);
        
        
//        NSLog(@"%@",percentURL);
        NSLog(@"happyModelArray==%lu",happyModelArray.count);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
    
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
