//
//  PageCollectionViewCell.m
//  新特性
//
//  Created by ZHANGHAI SHENG on 16/4/29.
//  Copyright © 2016年 ZHANGHAI SHENG. All rights reserved.
//

#import "PageCollectionViewCell.h"

@interface PageCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;

@property (weak, nonatomic) IBOutlet UIButton *beginBtn;


@end

@implementation PageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setIndex:(int)index{
    _index = index;
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%d", index];
    self.imageVIew.image = [UIImage imageNamed:imageName];
    
}

- (void)hiddenBeginBtn:(BOOL)isHidden{
    
    self.beginBtn.hidden = isHidden;
    // 2.判断按钮当前是否是显示的, 如果是就执行动画
    if (!isHidden) {
        self.beginBtn.transform = CGAffineTransformMakeScale(0.01, 0.01);
    }

    
}

- (void)startButtonAnim{
    
    /*
     第一个参数: 动画时长
     第二个参数: 延迟时间
     第三个参数: 震动幅度, 值越大越牛逼
     第四个参数: 初始速度, 0~1
     第五个参数: 动画效果
     第六个参数: 需要执行动画的代码
     第七个参数: 动画执行完毕之后的回调
     */
    self.beginBtn.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:100 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.beginBtn.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}

/**
 *  点击进入首页
 */
- (IBAction)beginBtnClick:(id)sender {
    //发布通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"enter" object:nil userInfo:nil];
}






@end
