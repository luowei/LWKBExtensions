# LWKBExtensions

[![CI Status](https://img.shields.io/travis/luowei/LWKBExtensions.svg?style=flat)](https://travis-ci.org/luowei/LWKBExtensions)
[![Version](https://img.shields.io/cocoapods/v/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)
[![License](https://img.shields.io/cocoapods/l/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)
[![Platform](https://img.shields.io/cocoapods/p/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```Objective-C

@interface NSArray (KBExtension)
//解析Emoji表情ini文件字符串
+ (NSArray *)dictFromEmoticonIni:(NSString *)iniString;
@end
```

```Objective-C
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
```

```Objective-C
@interface UIImageView (Rotate)

- (void)rotate360WithDuration:(CGFloat)duration repeatCount:(float)repeatCount;

- (void)pauseAnimations;

- (void)resumeAnimations;

- (void)stopAllAnimations;
@end
```

```Objective-C
@interface UIImageView (Extension)
- (void)setBorder:(CGFloat)borderWidth color:(UIColor*)color;
@end
```

## Requirements

## Installation

LWKBExtensions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LWKBExtensions'
```

**Carthage**
```ruby
github "luowei/LWKBExtensions"
```

## Author

luowei, luowei@wodedata.com

## License

LWKBExtensions is available under the MIT license. See the LICENSE file for more info.
