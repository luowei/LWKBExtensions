//
// Created by luowei on 2019/12/11.
//

#import <Foundation/Foundation.h>

@interface NSArray (KBExtension)

//解析Emoji表情ini文件字符串
+ (NSArray *)dictFromEmoticonIni:(NSString *)iniString;

@end