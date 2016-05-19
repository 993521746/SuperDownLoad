//
//  NSString+HomeDir.h
//  HomeDir
//
//  Created by ZHANGHAI SHENG on 16/4/19.
//  Copyright © 2016年 ZHANGHAI SHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

//**返回app沙盒下各目录并拼接字符串*/

@interface NSString (HomeDir)

//**返回Documents文件夹路径并拼接上self*/
- (instancetype)docDir;

//**返回Caches文件夹路径并拼接上self*/
- (instancetype)cacheDir;

//**返回tem文件夹路径并拼接上self*/
- (instancetype)tmpDir;

@end
