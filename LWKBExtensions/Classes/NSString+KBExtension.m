//
//  NSString+Ext.m
//  MyInputMethod
//
//  Created by luowei on 15/8/11.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "NSString+KBExtension.h"

@implementation NSString (KBExtension)

- (CGFloat)widthWithFont:(UIFont *)font andAttributes:(NSDictionary *)attributes {
    return [[[NSAttributedString alloc] initWithString:self attributes:attributes] size].width;
}

- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font andAttributes:(NSDictionary *)attributes {

    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self attributes:attributes];
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}

- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx, bool *stop))block {
    bool _stop = NO;
    for (NSInteger i = 0; i < [self length] && !_stop; i++) {
        NSString *character = [self substringWithRange:NSMakeRange(i, 1)];
        block(character, i, &_stop);
    }
}

-(NSString *)URLDecode{
    return [self stringByRemovingPercentEncoding];
}

-(NSString *)URLEncode{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:
            [[NSCharacterSet characterSetWithCharactersInString:@"!*'\"();:@&=+$,/?%#[]% "] invertedSet] ];
}

@end


@implementation NSString (UIImage)

- (UIImage *)image:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [[UIColor clearColor] set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    [self drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:(CGFloat) floor(size.width * 0.9)]}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
