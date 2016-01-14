//
//  BCHomeController.m
//  网易新闻
//
//  Created by Mac－C on 16/1/14.
//  Copyright © 2016年 毕灿. All rights reserved.
//

#import "BCHomeController.h"
#import "BCHomeChannelsModel.h"
#import "BCChannelLable.h"

@interface BCHomeController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray  *channels;

@end

@implementation BCHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource= self;
    self.collectionView.delegate = self;
    
    [self setTList];
    [self setupLayout];

}
- (void)setupLayout{
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
    self.flowLayout.minimumLineSpacing= 0;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;


}

#pragma 设置collection数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channels.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
    cell.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return cell;

}

- (void)setTList{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat lableX =5 ;
    CGFloat lableY = 0;
    CGFloat padding = 5;
    CGFloat height = self.scrollView.bounds.size.height;
    for (BCHomeChannelsModel * channelModel in self.channels) {
        
        BCChannelLable *tLable = [BCChannelLable lableWithTitle:channelModel.tname];
        
        tLable.frame = CGRectMake(lableX , lableY,tLable.frame.size.width ,height);
        
        [self.scrollView addSubview:tLable];
        
        lableX += (tLable.frame.size.width+ padding);
    }
    self.scrollView.contentSize = CGSizeMake(lableX, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;

}

- (NSArray *)channels{

    if (_channels == nil) {
        _channels =[BCHomeChannelsModel Channels];
    }
    return _channels;

}

@end
