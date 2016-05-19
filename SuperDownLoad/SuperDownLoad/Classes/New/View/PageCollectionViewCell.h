//
//  PageCollectionViewCell.h
//  新特性
//
//  Created by ZHANGHAI SHENG on 16/4/29.
//  Copyright © 2016年 ZHANGHAI SHENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageCollectionViewCell : UICollectionViewCell

/**index*/
@property (nonatomic, assign) int index;

- (void)hiddenBeginBtn:(BOOL)isHidden;

- (void)startButtonAnim;

@end
