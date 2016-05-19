//
//  SHSuperDownLoad.h
//  SuperDownLoad
//
//  Created by ZHANGHAI SHENG on 16/5/13.
//  Copyright © 2016年 ZHANGHAI SHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Single.h"

@interface SHSuperDownLoad : NSObject

//单例宏
SingleH(SHSuperDownLoad)

//传入url直接下载
- (void)downLoadWithUrl:(NSURL *)url;



@end
