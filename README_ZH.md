# LWKBExtensions

[![CI Status](https://img.shields.io/travis/luowei/LWKBExtensions.svg?style=flat)](https://travis-ci.org/luowei/LWKBExtensions)
[![Version](https://img.shields.io/cocoapods/v/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)
[![License](https://img.shields.io/cocoapods/l/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)
[![Platform](https://img.shields.io/cocoapods/p/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)

## 简介

LWKBExtensions 是一个专为万能输入法键盘开发的 Objective-C 扩展库，提供了一系列实用的类扩展方法，用于简化 iOS 开发中的常见任务。

## 功能特性

### NSArray 扩展

#### NSArray (KBExtension)
- **Emoji 表情解析**：解析 Emoji 表情的 ini 配置文件格式

```objective-c
@interface NSArray (KBExtension)

// 从 ini 格式字符串解析 Emoji 表情数据
// 参数 iniString: ini 格式的配置字符串
// 返回: 解析后的字典数组
+ (NSArray *)dictFromEmoticonIni:(NSString *)iniString;

@end
```

**使用场景**：适用于需要从 ini 配置文件加载 Emoji 表情数据的场景。

### NSString 扩展

#### NSString (KBExtension)
提供字符串的尺寸计算、字符遍历和 URL 编解码功能。

```objective-c
@interface NSString (KBExtension)

// 根据字体计算字符串宽度
- (CGFloat)widthWithFont:(UIFont *)font;

// 根据指定宽度和字体计算字符串高度
- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font;

// 逐字符遍历字符串
- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx, bool *stop))block;

// URL 解码
- (NSString *)URLDecode;

// URL 编码
- (NSString *)URLEncode;

@end
```

**主要功能**：
- **尺寸计算**：用于 UI 布局时精确计算文本尺寸
- **字符遍历**：提供便捷的字符级遍历方法
- **URL 处理**：支持 URL 的编码和解码操作

#### NSString (UIImage)
将字符串转换为图片。

```objective-c
@interface NSString (UIImage)

// 将字符串转换为指定尺寸的图片
// 参数 size: 图片尺寸
// 返回: 包含字符串内容的图片
- (UIImage *)image:(CGSize)size;

@end
```

**使用场景**：适用于需要将文字转换为图片的场景，如生成文字图标等。

### UIImageView 扩展

#### UIImageView (Rotate)
提供图片视图的旋转动画控制功能。

```objective-c
@interface UIImageView (Rotate)

// 执行 360 度旋转动画
// 参数 duration: 动画持续时间
// 参数 repeatCount: 重复次数，0 表示无限循环
- (void)rotate360WithDuration:(CGFloat)duration repeatCount:(float)repeatCount;

// 暂停动画
- (void)pauseAnimations;

// 恢复动画
- (void)resumeAnimations;

// 停止所有动画
- (void)stopAllAnimations;

@end
```

**主要功能**：
- **旋转动画**：实现流畅的 360 度旋转效果
- **动画控制**：支持暂停、恢复和停止动画

#### UIImageView (Extension)
为图片视图添加圆形边框效果。

```objective-c
@interface UIImageView (Extension)

// 设置圆形边框
// 参数 borderWidth: 边框宽度
// 参数 color: 边框颜色
- (void)setBorder:(CGFloat)borderWidth color:(UIColor*)color;

@end
```

**使用场景**：适用于需要为圆形头像添加边框的场景，自动处理阴影效果。

## 系统要求

- iOS 8.0 或更高版本
- Xcode 开发环境
- Objective-C 项目

## 安装方式

### CocoaPods

LWKBExtensions 支持通过 [CocoaPods](https://cocoapods.org) 安装。在 Podfile 中添加以下代码：

```ruby
pod 'LWKBExtensions'
```

然后执行：

```bash
pod install
```

### Carthage

在 Cartfile 中添加：

```ruby
github "luowei/LWKBExtensions"
```

然后执行：

```bash
carthage update
```

## 使用示例

### 示例 1：计算文本尺寸

```objective-c
NSString *text = @"Hello, World!";
UIFont *font = [UIFont systemFontOfSize:14];

// 计算文本宽度
CGFloat width = [text widthWithFont:font];

// 计算在指定宽度下的高度
CGFloat height = [text heigthWithWidth:200 andFont:font];
```

### 示例 2：URL 编解码

```objective-c
NSString *url = @"https://example.com/search?q=你好";
NSString *encodedURL = [url URLEncode];  // 编码
NSString *decodedURL = [encodedURL URLDecode];  // 解码
```

### 示例 3：字符串转图片

```objective-c
NSString *emoji = @"😊";
UIImage *image = [emoji image:CGSizeMake(50, 50)];
```

### 示例 4：旋转动画

```objective-c
UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];

// 开始无限循环旋转
[imageView rotate360WithDuration:2.0 repeatCount:0];

// 暂停动画
[imageView pauseAnimations];

// 恢复动画
[imageView resumeAnimations];

// 停止动画
[imageView stopAllAnimations];
```

### 示例 5：设置圆形边框

```objective-c
UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
avatarView.image = [UIImage imageNamed:@"avatar"];

// 添加白色边框
[avatarView setBorder:3.0 color:[UIColor whiteColor]];
```

### 示例 6：解析 Emoji ini 文件

```objective-c
NSString *iniContent = @"[emoji1]\n😊  smile\n[emoji2]\n😂  laugh";
NSArray *emojiArray = [NSArray dictFromEmoticonIni:iniContent];
```

## 示例项目

要运行示例项目，请按以下步骤操作：

1. 克隆仓库
2. 进入 Example 目录
3. 执行 `pod install`
4. 打开 `.xcworkspace` 文件

```bash
git clone https://github.com/luowei/LWKBExtensions.git
cd LWKBExtensions/Example
pod install
open LWKBExtensions.xcworkspace
```

## 技术实现

### NSArray+KBExtension
- 使用字符串分割和范围查找实现 ini 文件解析
- 支持多段配置的分组解析

### NSString+KBExtension
- 使用 NSAttributedString 计算文本尺寸
- 实现了安全的 URL 编码，排除特殊字符
- 提供基于 block 的字符遍历方法

### NSString+UIImage
- 使用 UIGraphicsBeginImageContextWithOptions 创建图形上下文
- 自动根据尺寸调整字体大小
- 支持透明背景

### UIImageView+Rotate
- 使用 CABasicAnimation 实现平滑旋转
- 通过 CALayer 的 speed 和 timeOffset 控制动画暂停和恢复
- 支持自定义旋转速度和重复次数

### UIImageView+Extension
- 使用 CAShapeLayer 绘制圆形边框
- 自动添加阴影效果
- 支持动态调整边框尺寸

## 项目信息

**作者**：luowei
**邮箱**：luowei@wodedata.com
**主页**：[https://github.com/luowei/LWKBExtensions](https://github.com/luowei/LWKBExtensions)
**版本**：1.0.0

## 许可证

LWKBExtensions 使用 MIT 许可证。详情请查看 [LICENSE](LICENSE) 文件。

```
MIT License

Copyright (c) 2019 luowei

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 贡献指南

欢迎提交问题和拉取请求！

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 更新日志

### 1.0.0
- 初始版本发布
- 支持 NSArray、NSString、UIImageView 等类的扩展
- 提供 Emoji 解析、文本尺寸计算、旋转动画等功能

## 常见问题

**Q: 这个库支持 Swift 吗？**
A: 这是一个 Objective-C 库，但可以在 Swift 项目中通过桥接头文件使用。

**Q: 最低支持的 iOS 版本是多少？**
A: iOS 8.0 及以上版本。

**Q: 如何报告 bug？**
A: 请在 [GitHub Issues](https://github.com/luowei/LWKBExtensions/issues) 页面提交问题。

## 相关链接

- [CocoaPods](https://cocoapods.org/pods/LWKBExtensions)
- [GitHub 仓库](https://github.com/luowei/LWKBExtensions)
- [问题跟踪](https://github.com/luowei/LWKBExtensions/issues)
