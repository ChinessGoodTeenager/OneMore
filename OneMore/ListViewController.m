//
//  ListViewController.m
//  OneMore
//
//  Created by apple on 16/5/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ListViewController.h"
#import "ListCellTableViewCell.h"
#import "HistoryModel.h"
@interface ListViewController ()

//@property(nonatomic,strong) UITableView *list;
@property(nonatomic,strong) NSMutableArray *listarray;
@property(nonatomic,assign) NSInteger page;
@property(nonatomic,assign) NSInteger pagesize;



@end

@implementation ListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
       [self createUI];
       [self firstLoad];

}


#pragma mark -创建视图
-(void)createUI{

    self.view.backgroundColor = [UIColor whiteColor];
//    _list = [[UITableView alloc]init];
        // 设置数据源
    self.baseTabView.dataSource = self;
    // 设置委托
    self.baseTabView.delegate = self;
    
    // 设置行高
    self.baseTabView.rowHeight = 100;
    
    self.baseTabView.frame = self.view.bounds;
    
    [self.baseTabView registerNib:[UINib nibWithNibName:@"ListCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"listcellID"];
    __weak typeof(self) weakSelf = self;
    
    [self.view addGestureRecognizer:self.swipeLeft];
    
    self.baseTabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.baseTabView.mj_footer.hidden = YES;
        [weakSelf requestListWithString:self.parametersString];
    }];

    [self.view addSubview:self.baseTabView];

}


#pragma mark -懒加载
-(NSMutableArray *)listarray{

    if (!_listarray ) {
        _listarray = [NSMutableArray array];
    }
    return _listarray;
}



//第一次加载
-(void)firstLoad{
    
    [self.baseTabView.mj_header beginRefreshing];
    
    [self requestListWithString:_parametersString];
    
}

#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",self.listarray.count);
    return self.listarray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *listcellID = @"listcellID";
    
    ListCellTableViewCell *listcell = [tableView dequeueReusableCellWithIdentifier:listcellID forIndexPath:indexPath];
    
    HitoryResult *model = self.listarray[indexPath.row];
    listcell.model = model;
    
  
    
    return listcell;
    
}

#pragma mark -数据相关
-(void)requestListWithString:(NSString *)string{
    // 百分号编码
    NSString * percentParameters = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    __weak typeof(self) weakSelf = self;
    // 拼接URL地址,nil格式化的时候会创建【(null)】
    NSString *url = [NSString stringWithFormat:self.requestURL,percentParameters];
    NSLog(@"url====%@",url);
    
    
    
    if (![string isEqualToString:@""]&&string.length>0) {
        [self.httpManager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *hisitoryArray = responseObject[@"result"];
            
            //转为模型数组
            NSArray *historyModelArray = [NSArray yy_modelArrayWithClass:[HitoryResult class] json:hisitoryArray];
            
            [weakSelf.listarray addObjectsFromArray:historyModelArray];
            
            //下拉刷新时候不加载新的数据
            NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"M/d"];
            
            if ([weakSelf.parametersString isEqualToString:[dateFormatter stringFromDate:[NSDate date]]]) {
                [weakSelf.listarray removeAllObjects];
            }
            //=====华丽的分割线========
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.listarray addObjectsFromArray:historyModelArray];
                [weakSelf.baseTabView reloadData];
                [weakSelf.baseTabView.mj_header endRefreshing];
                weakSelf.baseTabView.mj_header.hidden = NO;
            });
            
            NSLog(@"%lu",(unsigned long)weakSelf.listarray.count);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
        }];
        
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
