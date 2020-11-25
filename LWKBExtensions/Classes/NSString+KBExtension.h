//
//  NSString+Ext.h
//  MyInputMethod
//
//  Created by luowei on 15/8/11.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (KBExtension)

- (CGFloat)widthWithFont:(UIFont *)font;

- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font;

- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx, bool *stop))block;

-(NSString *)URLDecode;
-(NSString *)URLEncode;

@end


@interface NSString (UIImage)

- (UIImage *)image:(CGSize)size;

@end