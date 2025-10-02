# LWKBExtensions

[English](./README.md) | [中文版](./README_ZH.md)

[![CI Status](https://img.shields.io/travis/luowei/LWKBExtensions.svg?style=flat)](https://travis-ci.org/luowei/LWKBExtensions)
[![Version](https://img.shields.io/cocoapods/v/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)
[![License](https://img.shields.io/cocoapods/l/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)
[![Platform](https://img.shields.io/cocoapods/p/LWKBExtensions.svg?style=flat)](https://cocoapods.org/pods/LWKBExtensions)

A comprehensive collection of iOS extensions specifically designed for custom keyboard applications. This library provides essential utilities for keyboard input methods, emoji support, text processing, and UI enhancements.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
  - [CocoaPods](#cocoapods)
  - [Carthage](#carthage)
  - [Manual Installation](#manual-installation)
- [Usage](#usage)
- [API Documentation](#api-documentation)
  - [NSArray (KBExtension)](#nsarray-kbextension---emoji-configuration-parser)
  - [NSString (KBExtension)](#nsstring-kbextension---text-processing--measurement)
  - [NSString (UIImage)](#nsstring-uiimage---text-to-image-conversion)
  - [UIImageView (Rotate)](#uiimageview-rotate---animation-control)
  - [UIImageView (Extension)](#uiimageview-extension---border--styling)
- [Complete Usage Examples](#complete-usage-examples)
- [Swift Compatibility](#swift-compatibility)
- [Example Project](#example-project)
- [Technical Implementation](#technical-implementation)
- [Contributing](#contributing)
- [Support](#support)
- [Author](#author)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Features

LWKBExtensions is organized into four main categories, each designed to solve specific challenges in keyboard app development:

### 1. Emoji & Configuration Management
- **Emoji INI Parser**: Parse emoji configuration from INI format files for custom emoji keyboards
- Support for multi-section emoji organization and categorization

### 2. String Extensions for Keyboard Input
- **Dynamic Text Measurement**: Calculate text width and height with specific fonts for adaptive keyboard layouts
- **Character-Level Processing**: Enumerate characters individually for advanced input method logic
- **URL Encoding/Decoding**: Handle URL strings safely within keyboard context
- **Text-to-Image Conversion**: Generate image representations from text strings

### 3. Image View Animations
- **Rotation Animations**: Smooth 360-degree rotation effects for loading indicators
- **Animation Control**: Pause, resume, and stop animations programmatically
- **Custom Borders**: Add circular borders with shadow effects to image views

### 4. UI Enhancements
- **Border Styling**: Add customizable borders to UIImageView elements
- **Visual Effects**: Built-in shadow effects for enhanced UI appearance

## Requirements

- **iOS**: 8.0 or higher
- **Xcode**: 7.0 or higher
- **Language**: Objective-C
- **Architecture**: Compatible with armv7, arm64, i386, x86_64

Perfect for:
- Custom keyboard extensions
- Input method editors (IME)
- Emoji keyboards
- Predictive text systems
- Text processing applications

## Installation

### CocoaPods

LWKBExtensions is available through [CocoaPods](https://cocoapods.org). To install it, add the following line to your `Podfile`:

```ruby
pod 'LWKBExtensions'
```

Then run:
```bash
pod install
```

Import the library in your code:
```Objective-C
#import <LWKBExtensions/LWKBExtensions.h>
```

### Carthage

Add the following to your `Cartfile`:

```ruby
github "luowei/LWKBExtensions"
```

Then run:
```bash
carthage update
```

Import the framework:
```Objective-C
#import <LWKBExtensions/LWKBExtensions.h>
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/luowei/LWKBExtensions.git
```

2. Drag the `LWKBExtensions/Classes` folder into your Xcode project

3. Import the headers you need:
```Objective-C
#import "NSArray+KBExtension.h"
#import "NSString+KBExtension.h"
#import "UIImage+KBExtenstion.h"
#import "UIImageView+Extension.h"
```

## Usage

### Quick Start

After installation, import the library and start using the extensions:

```Objective-C
#import <LWKBExtensions/LWKBExtensions.h>

// Calculate text dimensions
NSString *text = @"Hello";
CGFloat width = [text widthWithFont:[UIFont systemFontOfSize:14]];

// Parse emoji configuration
NSArray *emojis = [NSArray dictFromEmoticonIni:emojiConfigString];

// Generate text image
UIImage *textImage = [@"A" image:CGSizeMake(40, 40)];

// Animate image view
[imageView rotate360WithDuration:1.5 repeatCount:HUGE_VALF];

// Style image view
[imageView setBorder:2.0 color:[UIColor blueColor]];
```

For detailed usage examples, see the [Complete Usage Examples](#complete-usage-examples) section below.

## API Documentation

### NSArray (KBExtension) - Emoji Configuration Parser

Parse emoji configuration files in INI format for custom keyboard applications:

```Objective-C
@interface NSArray (KBExtension)
/**
 * Parse emoji INI configuration file string
 * @param iniString INI-formatted string containing emoji configuration
 * @return Array of dictionaries with parsed emoji data
 *
 * Use case: Load and organize custom emoji sets for keyboard extensions
 * Supports multi-section INI files with [section] headers
 */
+ (NSArray *)dictFromEmoticonIni:(NSString *)iniString;
@end
```

**Example Usage:**
```Objective-C
// Load emoji configuration from bundle
NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"ini"];
NSString *emojiConfig = [NSString stringWithContentsOfFile:path
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];

// Parse emoji configuration
NSArray *emojis = [NSArray dictFromEmoticonIni:emojiConfig];

// Use in keyboard UI
for (NSDictionary *emojiSection in emojis) {
    NSString *sectionName = emojiSection[@"section"];
    NSArray *emojiList = emojiSection[@"items"];
    // Build emoji keyboard section...
}
```

**INI Format Example:**
```ini
[Smileys]
😀 grinning_face
😃 grinning_face_with_big_eyes
😄 grinning_face_with_smiling_eyes

[Hearts]
❤️ red_heart
💙 blue_heart
💚 green_heart
```

### NSString (KBExtension) - Text Processing & Measurement

Essential string utilities for keyboard layout and input processing:

```Objective-C
@interface NSString (KBExtension)

/**
 * Calculate the width of text with given font
 * @param font The font to use for measurement
 * @return The width required to display the string
 *
 * Use case: Dynamic keyboard key sizing based on text content
 */
- (CGFloat)widthWithFont:(UIFont *)font;

/**
 * Calculate the height of text with given width and font
 * @param width Maximum width constraint
 * @param font The font to use for measurement
 * @return The height required to display the string
 *
 * Use case: Multi-line text input preview and suggestion display
 */
- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font;

/**
 * Enumerate each character in the string
 * @param block Block called for each character with character, index, and stop flag
 *
 * Use case: Character-by-character processing for advanced input methods
 * Handles emoji and complex Unicode characters correctly
 */
- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx, bool *stop))block;

/**
 * URL decode the string
 * @return URL-decoded string
 */
- (NSString *)URLDecode;

/**
 * URL encode the string
 * @return URL-encoded string
 */
- (NSString *)URLEncode;

@end
```

**Example Usage:**

```Objective-C
// Example 1: Dynamic key sizing for keyboard
NSString *keyLabel = @"Enter";
UIFont *keyFont = [UIFont systemFontOfSize:16];
CGFloat requiredWidth = [keyLabel widthWithFont:keyFont];

// Adjust button width based on text
UIButton *keyButton = [UIButton buttonWithType:UIButtonTypeSystem];
CGRect frame = keyButton.frame;
frame.size.width = requiredWidth + 20; // Add padding
keyButton.frame = frame;

// Example 2: Calculate suggestion cell height
NSString *suggestion = @"This is a long suggestion text that may wrap";
CGFloat cellHeight = [suggestion heigthWithWidth:280 andFont:[UIFont systemFontOfSize:14]];

// Example 3: Process each character for input validation
NSString *userInput = @"Hello 👋 World 🌍";
NSMutableArray *validChars = [NSMutableArray array];

[userInput enumerateCharactersUsingBlock:^(NSString *character, NSInteger idx, bool *stop) {
    // Filter or process each character
    if (![character isEqualToString:@" "]) {
        [validChars addObject:character];
    }
    NSLog(@"Character %ld: %@", (long)idx, character);
}];

// Example 4: URL encoding for web queries
NSString *searchQuery = @"你好 世界";
NSString *encodedQuery = [searchQuery URLEncode];
NSString *url = [NSString stringWithFormat:@"https://api.example.com/search?q=%@", encodedQuery];

// Decode when needed
NSString *decodedQuery = [encodedQuery URLDecode];
```

### NSString (UIImage) - Text-to-Image Conversion

Generate image representations from text strings:

```Objective-C
@interface NSString (UIImage)

/**
 * Generate an image from the string with specified size
 * @param size The desired image size
 * @return UIImage containing the rendered text
 *
 * Use case: Create text-based keyboard buttons, emoji alternatives, or custom key graphics
 * Automatically adjusts font size to fit within the given dimensions
 * Supports transparent backgrounds
 */
- (UIImage *)image:(CGSize)size;

@end
```

**Example Usage:**

```Objective-C
// Example 1: Create keyboard letter keys
NSString *letter = @"A";
UIImage *keyImage = [letter image:CGSizeMake(40, 40)];
UIButton *keyButton = [UIButton buttonWithType:UIButtonTypeCustom];
[keyButton setImage:keyImage forState:UIControlStateNormal];

// Example 2: Generate emoji buttons for keyboard
NSArray *emojis = @[@"😀", @"😃", @"😄", @"😁"];
for (NSString *emoji in emojis) {
    UIImage *emojiImage = [emoji image:CGSizeMake(50, 50)];
    // Use emojiImage in your keyboard UI
}

// Example 3: Create custom symbol keys
UIImage *spaceKey = [@"space" image:CGSizeMake(120, 40)];
UIImage *returnKey = [@"return" image:CGSizeMake(80, 40)];
UIImage *deleteKey = [@"⌫" image:CGSizeMake(60, 40)];

// Example 4: Generate text badges or labels
UIImage *badgeImage = [@"NEW" image:CGSizeMake(30, 20)];
```

### UIImageView (Rotate) - Animation Control

Smooth rotation animations with full playback control:

```Objective-C
@interface UIImageView (Rotate)

/**
 * Rotate image view 360 degrees with specified duration and repeat count
 * @param duration Duration for one complete rotation in seconds
 * @param repeatCount Number of times to repeat (use HUGE_VALF for infinite rotation)
 *
 * Use case: Loading indicators, refresh animations, or decorative effects in keyboard UI
 * Uses CABasicAnimation for smooth, GPU-accelerated rotation
 */
- (void)rotate360WithDuration:(CGFloat)duration repeatCount:(float)repeatCount;

/**
 * Pause current animations
 * Preserves animation state for later resumption
 */
- (void)pauseAnimations;

/**
 * Resume paused animations
 * Continues animation from paused state
 */
- (void)resumeAnimations;

/**
 * Stop all animations
 * Immediately stops and removes all animations
 */
- (void)stopAllAnimations;

@end
```

**Example Usage:**

```Objective-C
// Example 1: Loading indicator for keyboard initialization
UIImageView *loadingIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading"]];
loadingIcon.frame = CGRectMake(0, 0, 40, 40);
[self.view addSubview:loadingIcon];

// Start infinite rotation
[loadingIcon rotate360WithDuration:1.5 repeatCount:HUGE_VALF];

// Stop when loading completes
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [loadingIcon stopAllAnimations];
    [loadingIcon removeFromSuperview];
});

// Example 2: Rotation with pause/resume control
UIImageView *refreshIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh"]];
[refreshIcon rotate360WithDuration:2.0 repeatCount:HUGE_VALF];

// Pause animation on user interaction
- (void)keyboardWillHide:(NSNotification *)notification {
    [refreshIcon pauseAnimations];
}

// Resume animation when keyboard appears
- (void)keyboardWillShow:(NSNotification *)notification {
    [refreshIcon resumeAnimations];
}

// Example 3: Limited rotation (rotate 5 times then stop)
UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
[iconView rotate360WithDuration:1.0 repeatCount:5];

// Example 4: Variable speed rotation
UIImageView *slowIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slow"]];
[slowIcon rotate360WithDuration:3.0 repeatCount:HUGE_VALF]; // Slower rotation

UIImageView *fastIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fast"]];
[fastIcon rotate360WithDuration:0.5 repeatCount:HUGE_VALF]; // Faster rotation
```

### UIImageView (Extension) - Border & Styling

Add customizable borders with automatic shadow effects:

```Objective-C
@interface UIImageView (Extension)

/**
 * Add a circular border to the image view
 * @param borderWidth Width of the border in points
 * @param color Color of the border
 *
 * Use case: Style profile pictures, emoji icons, or circular buttons in keyboard UI
 * Automatically creates circular masking and adds shadow effect
 * Perfect for avatar displays in keyboard extensions
 */
- (void)setBorder:(CGFloat)borderWidth color:(UIColor*)color;

@end
```

**Example Usage:**

```Objective-C
// Example 1: Create a circular avatar with border
UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
avatarView.image = [UIImage imageNamed:@"user_avatar"];
avatarView.layer.cornerRadius = 40; // Make it circular
avatarView.clipsToBounds = YES;
[avatarView setBorder:3.0 color:[UIColor whiteColor]];

// Example 2: Emoji button with colored border
UIImageView *emojiButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
emojiButton.image = [@"😀" image:CGSizeMake(50, 50)];
[emojiButton setBorder:2.0 color:[UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0]];

// Example 3: Multiple bordered icons in a keyboard row
NSArray *icons = @[@"icon1", @"icon2", @"icon3"];
CGFloat xPos = 10;

for (NSString *iconName in icons) {
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 10, 40, 40)];
    iconView.image = [UIImage imageNamed:iconName];
    iconView.layer.cornerRadius = 20;
    iconView.clipsToBounds = YES;
    [iconView setBorder:1.5 color:[UIColor grayColor]];
    [self.view addSubview:iconView];
    xPos += 50;
}

// Example 4: Selected state with border color change
- (void)selectIcon:(UIImageView *)iconView {
    [iconView setBorder:3.0 color:[UIColor blueColor]];
}

- (void)deselectIcon:(UIImageView *)iconView {
    [iconView setBorder:1.0 color:[UIColor lightGrayColor]];
}

// Example 5: Dynamic border based on theme
UIColor *borderColor = [self isDarkMode] ? [UIColor whiteColor] : [UIColor blackColor];
[profileImageView setBorder:2.5 color:borderColor];
```

## Complete Usage Examples

### Real-World Keyboard Implementation Example

```Objective-C
#import "LWKBExtensions.h"

@interface CustomKeyboardViewController : UIInputViewController

@property (nonatomic, strong) UIView *keyboardView;
@property (nonatomic, strong) NSArray *emojiData;

@end

@implementation CustomKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Example 1: Load and parse emoji configuration
    [self setupEmojiKeyboard];

    // Example 2: Create dynamic keyboard keys
    [self createDynamicKeys];

    // Example 3: Add loading indicator
    [self showLoadingIndicator];
}

- (void)setupEmojiKeyboard {
    // Load emoji INI file
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"ini"];
    NSString *iniContent = [NSString stringWithContentsOfFile:path
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];

    // Parse emoji configuration
    self.emojiData = [NSArray dictFromEmoticonIni:iniContent];

    // Create emoji buttons
    CGFloat xPos = 10;
    for (NSDictionary *section in self.emojiData) {
        NSArray *emojis = section[@"items"];
        for (NSString *emoji in emojis) {
            UIButton *emojiButton = [self createEmojiButton:emoji atX:xPos];
            [self.keyboardView addSubview:emojiButton];
            xPos += 50;
        }
    }
}

- (UIButton *)createEmojiButton:(NSString *)emoji atX:(CGFloat)x {
    // Use text-to-image conversion
    UIImage *emojiImage = [emoji image:CGSizeMake(40, 40)];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, 10, 45, 45);
    [button setImage:emojiImage forState:UIControlStateNormal];

    // Add border styling
    button.imageView.layer.cornerRadius = 22.5;
    button.imageView.clipsToBounds = YES;
    [(UIImageView *)button.imageView setBorder:1.5 color:[UIColor lightGrayColor]];

    [button addTarget:self action:@selector(emojiButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

- (void)createDynamicKeys {
    NSArray *keys = @[@"Q", @"W", @"E", @"R", @"T", @"Y"];
    UIFont *keyFont = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];

    CGFloat xPos = 10;
    for (NSString *key in keys) {
        // Calculate dynamic width based on text
        CGFloat textWidth = [key widthWithFont:keyFont];
        CGFloat buttonWidth = textWidth + 20; // Add padding

        UIButton *keyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        keyButton.frame = CGRectMake(xPos, 60, buttonWidth, 40);
        [keyButton setTitle:key forState:UIControlStateNormal];
        keyButton.titleLabel.font = keyFont;

        [self.keyboardView addSubview:keyButton];
        xPos += buttonWidth + 5;
    }
}

- (void)showLoadingIndicator {
    UIImageView *loadingIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spinner"]];
    loadingIcon.frame = CGRectMake(150, 120, 30, 30);
    [self.keyboardView addSubview:loadingIcon];

    // Start rotation animation
    [loadingIcon rotate360WithDuration:1.0 repeatCount:HUGE_VALF];

    // Stop after data loads
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [loadingIcon stopAllAnimations];
        [loadingIcon removeFromSuperview];
    });
}

- (void)emojiButtonTapped:(UIButton *)sender {
    // Insert emoji into text
    NSString *emoji = sender.titleLabel.text;
    [self.textDocumentProxy insertText:emoji];
}

@end
```

### Example: Dynamic Suggestion Bar

```Objective-C
- (void)updateSuggestionBar:(NSArray<NSString *> *)suggestions {
    // Clear existing suggestions
    for (UIView *subview in self.suggestionBar.subviews) {
        [subview removeFromSuperview];
    }

    CGFloat xPos = 10;
    UIFont *suggestionFont = [UIFont systemFontOfSize:14];

    for (NSString *suggestion in suggestions) {
        // Calculate required width
        CGFloat width = [suggestion widthWithFont:suggestionFont];
        CGFloat buttonWidth = width + 30; // Add padding

        // Calculate required height for multi-line suggestions
        CGFloat height = [suggestion heigthWithWidth:buttonWidth - 20 andFont:suggestionFont];

        UIButton *suggestionButton = [UIButton buttonWithType:UIButtonTypeSystem];
        suggestionButton.frame = CGRectMake(xPos, 5, buttonWidth, MAX(height + 10, 30));
        [suggestionButton setTitle:suggestion forState:UIControlStateNormal];
        suggestionButton.titleLabel.font = suggestionFont;
        suggestionButton.titleLabel.numberOfLines = 0;

        [self.suggestionBar addSubview:suggestionButton];
        xPos += buttonWidth + 5;
    }
}
```

### Example: URL-Based Cloud Suggestions

```Objective-C
- (void)fetchCloudSuggestions:(NSString *)inputText {
    // Encode user input for API call
    NSString *encodedText = [inputText URLEncode];
    NSString *apiURL = [NSString stringWithFormat:@"https://api.example.com/suggest?q=%@", encodedText];

    // Make API call and process results
    [self makeAPICall:apiURL completion:^(NSArray *results) {
        // Decode and display suggestions
        NSMutableArray *decodedResults = [NSMutableArray array];
        for (NSString *result in results) {
            [decodedResults addObject:[result URLDecode]];
        }
        [self updateSuggestionBar:decodedResults];
    }];
}
```

## Swift Compatibility

While LWKBExtensions is written in Objective-C, it can be used seamlessly in Swift projects:

### Swift Import Example

```swift
import LWKBExtensions

// Use extensions directly
let text = "Hello"
let width = text.width(with: UIFont.systemFont(ofSize: 14))

// Emoji parsing
let emojis = NSArray.dictFromEmoticonIni(iniString)

// Image generation
let textImage = "A".image(CGSize(width: 40, height: 40))

// Image view animation
imageView.rotate360(withDuration: 1.5, repeatCount: Float.greatestFiniteMagnitude)

// Border styling
imageView.setBorder(2.0, color: .blue)
```

## Example Project

To run the example project:

```bash
git clone https://github.com/luowei/LWKBExtensions.git
cd LWKBExtensions/Example
pod install
open LWKBExtensions.xcworkspace
```

The example project demonstrates:
- Custom keyboard implementation with all extensions
- Emoji keyboard with INI file parsing
- Dynamic key sizing and layout
- Loading animations and indicators
- Border styling for UI elements

## Technical Implementation

### NSArray+KBExtension
- Parses INI files using string splitting and range finding
- Supports multi-section configuration with `[section]` headers
- Returns structured array of dictionaries for easy consumption

### NSString+KBExtension
- Uses `NSAttributedString` for accurate text measurement
- Implements safe URL encoding excluding special characters
- Character enumeration handles emoji and complex Unicode correctly

### NSString+UIImage
- Uses `UIGraphicsBeginImageContextWithOptions` for high-quality rendering
- Automatically adjusts font size to fit specified dimensions
- Supports transparent backgrounds for flexible compositing

### UIImageView+Rotate
- Implements smooth rotation using `CABasicAnimation`
- Controls animation state via CALayer's `speed` and `timeOffset` properties
- GPU-accelerated for optimal performance

### UIImageView+Extension
- Uses `CAShapeLayer` for circular border rendering
- Automatically adds shadow effects for depth
- Dynamically adjusts to view size changes

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Support

If you encounter any issues or have questions:
- Open an issue on [GitHub Issues](https://github.com/luowei/LWKBExtensions/issues)
- Check existing issues for similar problems
- Provide detailed information about your environment and the problem

## Author

**luowei**
- Email: luowei@wodedata.com
- GitHub: [@luowei](https://github.com/luowei)

## License

LWKBExtensions is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

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

## Acknowledgments

Special thanks to all contributors who have helped improve this library. LWKBExtensions was originally developed for custom keyboard applications and has been refined through real-world usage in production apps.

---

Made with care for the iOS keyboard development community.
