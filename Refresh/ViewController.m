//
//  ViewController.m
//  Refresh
//
//  Created by 郭洪安 on 2017/6/2.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "ViewController.h"
#import "MJLQHeader.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView * table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.table.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_table];
    [self createHeaderRefresh];
}
- (void)createHeaderRefresh{
   MJLQHeader *header = [MJLQHeader headerWithRefreshingTarget:self refreshingAction:@selector(downloadData)];

   // 隐藏时间
   header.lastUpdatedTimeLabel.hidden = YES;
   // 隐藏状态
   header.stateLabel.hidden = YES;
    // 设置header
    self.table.mj_header = header;

}
- (void)downloadData{
        __weak __typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        [weakSelf.table.mj_header endRefreshing];
       
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}


#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
