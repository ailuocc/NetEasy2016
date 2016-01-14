//
//  NewsViewController.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "NewsViewController.h"
#import "BCNews.h"
#import "BCNewsCell.h"

@interface NewsViewController ()

@property (nonatomic, strong) NSArray *news;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不扩展 控制器View中存在导航控制器时,控制器的View该怎么扩展（上下左右，不）
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 自动设置间距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)viewDidLayoutSubviews{
    [self loadData];

}

- (void)loadData{
  
    [BCNews newWithSuccess:^(NSArray *news) {
        self.news = news;
        
        [self.tableView reloadData];
    } error:^(NSError *error) {
        NSLog(@"NewsError = %@",error);
    }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BCNews *newModel = self.news[indexPath.row];
    
    
    BCNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[newModel IDentifiler]];
   
    
    cell.newsModel = newModel;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BCNews *newModel = self.news[indexPath.row];
    if (newModel.imgextra) {
        return 130
        ;
    }else if(newModel.imgType){
    
        return 200;
    }else{
    
        return 90;
    }

}

@end
