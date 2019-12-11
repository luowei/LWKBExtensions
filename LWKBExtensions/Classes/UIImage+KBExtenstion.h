//
//  UIImage+Color.h
//  MyInputMethod
//
//  Created by luowei on 15/8/11.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KBExtenstion)

@end


//旋转
@interface UIImageView (Rotate)

- (void)rotate360WithDuration:(CGFloat)duration repeatCount:(float)repeatCount;

- (void)pauseAnimations;

- (void)resumeAnimations;

- (void)stopAllAnimations;
@end

