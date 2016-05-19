//
//  NSString+HomeDir.m
//  HomeDir
//
//  Created by ZHANGHAI SHENG on 16/4/19.
//  Copyright © 2016年 ZHANGHAI SHENG. All rights reserved.
//

#import "NSString+HomeDir.h"

@implementation NSString (HomeDir)

#pragma mark - 沙盒目录路径操作

//**返回Documents文件夹路径并拼接上self*/
- (instancetype)docDir
{
    // Documents文件夹
    // 在某个范围内容搜索文件夹的路径
    // directory:获取哪个文件夹
    // domainMask:在哪个范围下获取 NSUserDomainMask:在用户的范围内搜索
    // expandTilde是否展开全路径,YES:展开
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    // 拼接文件路径
    NSString *filePath = [documentPath stringByAppendingPathComponent:self];
    
    return filePath;
}

//**返回Caches文件夹路径并拼接上self*/
- (instancetype)cacheDir
{
    // Caches文件夹
    // 在某个范围内容搜索文件夹的路径
    // directory:获取哪个文件夹
    // domainMask:在哪个范围下获取 NSUserDomainMask:在用户的范围内搜索
    // expandTilde是否展开全路径,YES:展开
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    // 拼接文件路径
    NSString *filePath = [cachePath stringByAppendingPathComponent:self];
    
    return filePath;
}

//**返回tem文件夹路径并拼接上self*/
- (instancetype)tmpDir
{
    //获取tmp文件夹路径
    NSString *tmpPath = NSTemporaryDirectory();
    
    // 拼接文件路径
    NSString *filePath = [tmpPath stringByAppendingPathComponent:self];
    
    return filePath;
}

@end
