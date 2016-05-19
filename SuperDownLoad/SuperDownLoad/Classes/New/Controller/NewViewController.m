//
//  NewViewController.m
//  新特性
//
//  Created by ZHANGHAI SHENG on 16/4/29.
//  Copyright © 2016年 ZHANGHAI SHENG. All rights reserved.
//

#import "NewViewController.h"
#import "PageCollectionViewCell.h"

#define MaxPageNum 4


@interface NewViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) UICollectionView *collectionView;

/**layout*/
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

@property (weak, nonatomic) UIButton *jumpBtn;

/**timer*/
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置collectionView代理和数据源
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    //注册cell
    UINib *nib =  [UINib nibWithNibName:NSStringFromClass([PageCollectionViewCell class]) bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    
    //创建jumpButton
    UIButton *jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jumpBtn.layer.cornerRadius = 35;
    jumpBtn.layer.masksToBounds = YES;
    [jumpBtn setBackgroundColor:[UIColor colorWithRed:0 green:191/255.0 blue:171/255.0 alpha:0.6]];
    [jumpBtn setTintColor:[UIColor whiteColor]];
    [jumpBtn setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:jumpBtn];
    [jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.collectionView).offset(ScreenWide - 80);
        make.top.equalTo(self.collectionView).offset(50);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    jumpBtn.hidden = NO;
    //添加处理事件
    [jumpBtn addTarget:self action:@selector(jump2HomePage) forControlEvents:UIControlEventTouchUpInside];

    self.jumpBtn = jumpBtn;
    
    //创建定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(jump) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;

  

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return MaxPageNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.index = (int)indexPath.item + 1;
    if (cell.index ==  MaxPageNum) {
        [cell hiddenBeginBtn:NO];
    }else{
        [cell hiddenBeginBtn:YES];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
     //注意：传递给我们的是上一页的indexPath，而不是当前页
     // 获取当前显示的cell对应的索引
    NSIndexPath *path = collectionView.indexPathsForVisibleItems.lastObject;
    // 根据索引获取对应页的cell, 然后调用cell的方法执行动画
    PageCollectionViewCell *myCell = [collectionView cellForItemAtIndexPath:path];
    // 判断是否是最后一页
    if (path.item == (MaxPageNum - 1)) {
        [myCell startButtonAnim];
    }
}



#pragma mark - 懒加载

- (UICollectionViewFlowLayout *)layout{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _layout;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        //设置layout属性
        self.layout.itemSize = self.view.bounds.size;
        self.layout.minimumLineSpacing = 0;
        self.layout.minimumInteritemSpacing = 0;
        self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //创建collectionView
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        view.bounces = NO;
        view.showsVerticalScrollIndicator = NO;
        view.showsHorizontalScrollIndicator = NO;
        view.pagingEnabled = YES;
        [self.view addSubview:view];
         _collectionView = view;
    }
    return _collectionView;
}

/**
 *  定时器方法
 */

- (void)jump{
    static int index = 3;
    NSString *strTemp = [NSString stringWithFormat:@"%ds", index];
    [self.jumpBtn setTitle:strTemp forState:UIControlStateNormal];
    index--;
    if (index < 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.jumpBtn.hidden = YES;
        [self jump2HomePage];
    }
 
}


- (void)jump2HomePage{
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:EnterHome object:nil];
    
}

@end
