//
//  BCHeadLineViewController.m
//  网易新闻
//
//  Created by Mac－C on 16/1/13.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCHeadLineViewController.h"
#import "HeadLineModel.h"
#import "BCNetworkTool.h"
#import "HeadLineCell.h"


@interface BCHeadLineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UILabel *titleLable;
@property (nonatomic, weak) IBOutlet UIPageControl *page;
@property (nonatomic, strong) NSArray *headLines;

@end

@implementation BCHeadLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    

    [self loadData];

}

// 布局完控制器的VIew 就调用
- (void)viewDidLayoutSubviews
{
    [self setupLayout];

}

/**
 *  获取数据
 */
- (void)loadData{
    [HeadLineModel headLinesWithSuccess:^(NSArray *headLines) {
        NSArray *headArray = headLines;
        NSMutableArray *tempHead = [NSMutableArray arrayWithArray:headArray];
        // 第一个添加到最后
        [tempHead addObject:[headArray firstObject]];
        // 最后一个插入到第一个位置
        [tempHead insertObject:[headArray lastObject] atIndex:0];
        self.headLines = tempHead.copy;
     
        // 获得数据要刷新表格
        [self.collectionView reloadData];
        // 默认显示第一张（不是第0张）
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

    } error:^(NSError *error) {
        NSLog(@"HeadLineError = %@",error);
    }];

}
/**
 *  布局
 */
- (void)setupLayout{
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    // page
    self.collectionView.pagingEnabled = YES;
    // Direction
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 水平间距
    self.flowLayout.minimumLineSpacing = 0;
    // 弹簧效果
    self.collectionView.bounces = NO;
    // 水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
//    self.collectionView.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.headLines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeadLineModel *model = self.headLines[indexPath.item];
    HeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeadLine" forIndexPath:indexPath];
    
//    self.page.currentPage = indexPath.item-1;

    cell.model = model;

    return cell;
}

// 拖动就调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = (scrollView.contentOffset.x +self.collectionView.bounds.size.width *0.5)/ self.collectionView.bounds.size.width;
    HeadLineModel *model = self.headLines[index];
    
    self.titleLable.text = model.title;
    self.page.currentPage = index-1;
    // 最后一张 则跳
    if (index == self.headLines.count - 1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }else if (index == 0){// 第一张 则跳
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.headLines.count-2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
    }

}


@end
