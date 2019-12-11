//
// Created by luowei on 2019/12/11.
//

#import "NSArray+KBExtension.h"



@implementation NSArray (KBExtension)

//解析Emoji表情ini文件字符串
+ (NSArray *)dictFromEmoticonIni:(NSString *)iniString {
    NSMutableArray *iniArr= @[].mutableCopy;

    NSString *section = nil;
    NSMutableDictionary *itemDict = nil;

    for (NSString *line in [iniString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]) {
        NSString *trimLine = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (!line || (trimLine && [trimLine length] == 0)) {
            continue;
        }

        NSRange startChar = [line rangeOfString:@"["];
        NSRange endChar = [line rangeOfString:@"]"];


        if (startChar.location != NSNotFound && endChar.location != NSNotFound && endChar.location > startChar.location) {
            //把原itemDict保存到数组
            if(itemDict != nil){
                [iniArr addObject:itemDict];
            }
            //初始化新itemDict
            itemDict = @{}.mutableCopy;
            section = [line substringWithRange:NSMakeRange(startChar.location + 1, endChar.location - (startChar.location + 1))];
        } else {
            NSArray *split = [line componentsSeparatedByString:@"  "];
            itemDict[section] = split ? split : [NSNull new];
        }
    }
    //添加最后一个itemDict
    [iniArr addObject:itemDict];

    return iniArr;
}


@end
