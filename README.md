<p align="center">
  <img src="http://i.imgur.com/BwqHhB4.png" alt="Chameleon by Vicc Alexander"/>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg?style=flat" alt="Platform: iOS 13+"/>
    <a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-swift%205-4BC51D.svg?style=flat" alt="Language: Swift 5" /></a>
    <a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="Swift Package Manager compatible" /></a>
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat" alt="License: MIT" />
    <img src="https://img.shields.io/badge/iOS-13.0%2B-blue.svg" alt="iOS 13.0+"/>
    <img src="https://img.shields.io/badge/Dark%20Mode-supported-green.svg" alt="Dark Mode"/>
</p>

## Introduction

**Chameleon** is a lightweight, yet powerful, color framework for iOS (Objective-C & Swift). It is built on the idea that software applications should function effortlessly while simultaneously maintaining their beautiful interfaces.

This version has been **completely updated for iOS 13+** with full **Dark Mode support** and **Swift Package Manager** compatibility.

With Chameleon, you can easily stop tinkering with RGB values, wasting hours figuring out the right color combinations to use in your app, and worrying about whether your text will be readable on the various background colors of your app.

### Features

<p align="center">
  <img src="http://i.imgur.com/lA4J37o.png" alt="Features"/>
</p>

## Table of Contents
[● Product Features](#-product-features)  
[● Requirements](#️-requirements)  
[● Installation](#-installation)  
[● Usage](#-usage)  
[● UIColor Methods](#uicolor-methods)  
[● iOS 13+ Dark Mode](#-ios-13-dark-mode-support)  
[● Status Bar Methods](#-status-bar-style-ios-13)  
[● Color Schemes](#-color-schemes)  
[● Gradient Colors](#-gradient-colors)  
[● Migration Guide](#migration-từ-ios-12-lên-ios-13)  
[● Troubleshooting](#khắc-phục-sự-cố)  
[● License](#-license)  
[● Changelog](#changelog)  

## 🌟 Product Features

### 100% Flat & Gorgeous + Dark Mode Support

Chameleon features over 24 hand-picked colors that come in both light and dark shades, with **full iOS 13+ Dark Mode support**.

<p align="center">
  <img src="http://i.imgur.com/wkGGWkN.png" alt="Swatches"/>
</p>

### iOS 13+ Dynamic Colors

Create colors that automatically adapt to Light/Dark mode:

```objc
// Dynamic colors that adapt to system appearance
UIColor *adaptiveColor = [UIColor colorWithLightModeColor:[UIColor flatBlueColor]
                                            darkModeColor:[UIColor flatBlueDarkColor]];
```

### Modern Status Bar Handling

No more deprecated APIs! Handle status bar with modern iOS 13+ approach:

```objc
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent; // New iOS 13+ style
    } else {
        return UIStatusBarStyleDefault;
    }
}
```

### Contrasting Text
With a plethora of color choices available for text, it's difficult to choose one that all users will appreciate and be able to read. Whether you're in doubt of your text and tint color choices, or afraid to let users customize their profile colors because it may disturb the legibility or usability of the app, you no longer have to worry.

<p align="center">
  <img src="http://s29.postimg.org/i1syd7bkn/Contrast.gif" alt="Status Bar"/>
</p>

## ⚠️ Requirements

* **iOS 13.0+** (Updated for modern iOS)
* **Xcode 12+**
* **Swift 5.0+**
* Objective-C or Swift

## 📦 Installation

### Swift Package Manager Installation

Chameleon is fully compatible with **Swift Package Manager**.

#### Method 1: Through Xcode (Recommended)

1. Open your project in Xcode
2. Go to **File** > **Add Package Dependencies...**
3. Enter the repository URL: `https://github.com/hoang1105/ChameleonSPM.git`
4. Select the appropriate version and click **Add Package**
5. Select your app target and click **Add Package**

#### Method 2: Through Package.swift

Add the dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/hoang1105/ChameleonSPM.git", .upToNextMajor(from: "3.0.0"))
]
```

## 🚀 Usage

To use the myriad of features in Chameleon, include the following import:

### Framework Import

#### Swift:
```swift
import ChameleonSwift
```

#### Objective-C:
```objc
#import <Chameleon/Chameleon.h>
```

### Quick Examples

#### Swift:
```swift
import UIKit
import ChameleonSwift

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use flat colors
        view.backgroundColor = UIColor.flatMint
        
        // Create complementary colors
        let complementaryColor = UIColor(complementaryFlatColorOf: UIColor.flatMint)
        
        // Random flat colors
        let randomColor = UIColor.randomFlat
        
        // iOS 13+ Dark Mode support
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor.colorWithLightModeColor(UIColor.flatMint, 
                                                     darkModeColor: UIColor.flatMintDark)
            view.backgroundColor = dynamicColor
        }
    }
    
    // Modern status bar handling
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
}
```

#### Objective-C:
```objc
#import "ViewController.h"
#import <Chameleon/Chameleon.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Use flat colors
    self.view.backgroundColor = [UIColor flatMintColor];
    
    // Create complementary colors
    UIColor *complementaryColor = [UIColor colorWithComplementaryFlatColorOf:[UIColor flatMintColor]];
    
    // iOS 13+ Dark Mode support
    if (@available(iOS 13.0, *)) {
        UIColor *dynamicColor = [UIColor colorWithLightModeColor:[UIColor flatMintColor]
                                                   darkModeColor:[UIColor flatMintDarkColor]];
        self.view.backgroundColor = dynamicColor;
    }
}

// Modern status bar handling (iOS 13+)
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

@end
```

## UIColor Methods
[● Flat Colors](#flat-colors)   
[● Random Colors](#random-colors)  
[● Complementary Colors](#complementary-colors)  
[● Contrasting Colors](#contrasting-colors)  
[● Gradient Colors](#gradient-colors-1)   
[● Hex Colors](#hex-colors)  
[● Lighter & Darker Colors](#lighter-and-darker-colors)

### Flat Colors
Using a flat color is as easy as adding any other color in your app:

#### Normal Convention:
```objc
// Objective-C
self.view.backgroundColor = [UIColor flatGreenColorDark];

// Swift
view.backgroundColor = UIColor.flatGreenDark
```

#### Chameleon Shorthand:
```objc
// Objective-C
self.view.backgroundColor = FlatGreenDark;

// Swift
view.backgroundColor = FlatGreenDark()
```

### Random Colors
Generate random flat colors easily:

```objc
// Random flat color
UIColor *randomColor = [UIColor randomFlatColor];

// Random color with specific shade
UIColor *randomLight = [UIColor colorWithRandomFlatColorOfShadeStyle:UIShadeStyleLight];
```

### Complementary Colors
Create complementary colors:

```objc
UIColor *complementary = [UIColor colorWithComplementaryFlatColorOf:someColor];
```

### Contrasting Colors
Automatically choose contrasting text colors:

```objc
UIColor *contrastColor = [UIColor colorWithContrastingBlackOrWhiteColorOn:backgroundColor isFlat:YES];
```

### Hex Colors
Use hex strings to create colors:

```objc
UIColor *hexColor = [UIColor colorWithHexString:@"#2ECC71"];
```

### Lighter and Darker Colors
Modify color brightness:

```objc
UIColor *lighterColor = [someColor lightenByPercentage:0.2];
UIColor *darkerColor = [someColor darkenByPercentage:0.3];
```

**Objective-C:**
```objc
#import "ViewController.h"
#import <Chameleon/Chameleon.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Sử dụng màu flat
    self.view.backgroundColor = [UIColor flatMintColor];
    
    // Tạo màu bổ sung
    UIColor *complementaryColor = [UIColor colorWithComplementaryFlatColorOf:[UIColor flatMintColor]];
    
    // iOS 13+ Dark Mode support
    if (@available(iOS 13.0, *)) {
        UIColor *dynamicColor = [UIColor colorWithLightModeColor:[UIColor flatMintColor]
                                                   darkModeColor:[UIColor flatMintDarkColor]];
        self.view.backgroundColor = dynamicColor;
    }
}

// Modern status bar handling (iOS 13+)
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

@end
```

## Tính năng chính

### 🎨 **Flat Colors**
Hơn 24 màu flat được thiết kế đẹp mắt với phiên bản sáng và tối:
```objc
```

## 🌓 iOS 13+ Dark Mode Support

Chameleon now fully supports iOS 13+ Dark Mode with dynamic colors:

```objc
// Create dynamic colors that adapt to system appearance
UIColor *dynamicColor = [UIColor colorWithLightModeColor:[UIColor flatBlueColor] 
                                           darkModeColor:[UIColor flatBlueDarkColor]];

// Use in your UI
self.view.backgroundColor = dynamicColor;
```

The color will automatically switch between light and dark variants when the user changes their system appearance.

## 📊 Status Bar Style (iOS 13+)

Modern status bar handling without deprecated APIs:

```objc
// In your View Controller
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent; // New iOS 13+ style for dark text
    } else {
        return UIStatusBarStyleDefault;     // Fallback
    }
}

// Or use contrasting style
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self contrastingStatusBarStyleForColor:self.navigationController.navigationBar.barTintColor];
}
```

## 🎯 Color Schemes

Generate color schemes from any color:

### Analogous Color Scheme
```objc
NSArray *analogousColors = [NSArray arrayOfColorsWithColorScheme:ColorSchemeAnalogous
                                                      usingColor:[UIColor flatGreenColor]
                                                   withFlatScheme:YES];
```

### Complementary Color Scheme
```objc
NSArray *complementaryColors = [NSArray arrayOfColorsWithColorScheme:ColorSchemeComplementary
                                                          usingColor:[UIColor flatRedColor]
                                                       withFlatScheme:YES];
```

### Triadic Color Scheme
```objc
NSArray *triadicColors = [NSArray arrayOfColorsWithColorScheme:ColorSchemeTriadic
                                                    usingColor:[UIColor flatBlueColor]
                                                 withFlatScheme:YES];
```

## 🎨 Gradient Colors

Create beautiful gradients with ease:

```objc
NSArray *colors = @[[UIColor flatRedColor], [UIColor flatOrangeColor]];
UIColor *gradientColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight 
                                               withFrame:self.view.bounds 
                                               andColors:colors];

// Apply to your view
self.view.backgroundColor = gradientColor;
```

**Available Gradient Styles:**
- `UIGradientStyleLeftToRight`
- `UIGradientStyleTopToBottom` 
- `UIGradientStyleRadial`

## 🖼️ Colors From Images

Extract colors from images:

```objc
// Get average color from image
UIColor *averageColor = [UIColor colorWithAverageColorFromImage:myImage];

// Extract color palette from image
NSArray *colorPalette = [NSArray arrayOfColorsFromImage:myImage withFlatScheme:YES];
```
```

### 🌓 **iOS 13+ Dark Mode Support** 
Tạo màu động thích ứng với Light/Dark mode:
```objc
// Tạo màu dynamic cho iOS 13+
UIColor *dynamicColor = [UIColor colorWithLightModeColor:[UIColor flatBlueColor] 
                                           darkModeColor:[UIColor flatBlueDarkColor]];

// Màu sẽ tự động thay đổi khi user chuyển Dark/Light mode
self.view.backgroundColor = dynamicColor;
```

### 📊 **Status Bar Style (iOS 13+)**
Quản lý status bar style hiện đại:
```objc
// Trong View Controller
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent; // Cho text màu tối trên background sáng
    } else {
        return UIStatusBarStyleDefault;     // Fallback cho iOS 12
    }
}

// Hoặc sử dụng contrasting style
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self contrastingStatusBarStyleForColor:self.navigationController.navigationBar.barTintColor];
}
```

### 🎨 **Gradient Colors**
Tạo gradient với nhiều hướng khác nhau:
```objc
NSArray *colors = @[[UIColor flatRedColor], [UIColor flatOrangeColor]];
UIColor *gradientColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight 
                                               withFrame:self.view.bounds 
                                               andColors:colors];
```

### 🎯 **Color Schemes** 
Tạo bảng màu tự động từ màu gốc:
```objc
NSArray *colorScheme = [NSArray arrayOfColorsWithColorScheme:ColorSchemeAnalogous
                                                  usingColor:[UIColor flatGreenColor]
                                               withFlatScheme:YES];
```

### ⚡ **Contrasting Colors**
Tự động chọn màu tương phản phù hợp:
```objc
UIColor *contrastColor = [UIColor colorWithContrastingBlackOrWhiteColorOn:[UIColor flatRedColor] 
                                                                   isFlat:YES];
```

### 🖼️ **Image Colors**
Trích xuất màu từ hình ảnh:
```objc
UIColor *averageColor = [UIColor colorWithAverageColorFromImage:myImage];
```

## Migration từ iOS 12 lên iOS 13+

### ⚠️ Breaking Changes

1. **Status Bar API đã thay đổi:**
```objc
## ⚡ Contrasting Colors

Automatically generate contrasting colors for optimal readability:

```objc
// Get black or white contrast color
UIColor *contrastColor = [UIColor colorWithContrastingBlackOrWhiteColorOn:[UIColor flatRedColor] 
                                                                   isFlat:YES];

// Use for text over background
label.textColor = contrastColor;
label.backgroundColor = [UIColor flatRedColor];
```

## 🏷️ UIButton Enhancements

Enhanced button styling with flat colors:

```objc
// Set flat button colors
[button setFlatBackgroundColor:[UIColor flatBlueColor] 
               forState:UIControlStateNormal];
[button setFlatBackgroundColor:[UIColor flatBlueDarkColor] 
               forState:UIControlStateHighlighted];

// Automatically set contrasting text color
[button setContrastingTitleColorForState:UIControlStateNormal];
```

## 🔤 UILabel Enhancements

Automatic text color based on background:

```objc
// Set background and auto-contrast text
label.backgroundColor = [UIColor flatRedColor];
[label setTextColorBasedOnBackgroundColor];

// Or specify flat color directly
[label setFlatTextColor:[UIColor flatWhiteColor]];
```

## 🚀 Migration from iOS 12 to iOS 13+

### Status Bar Changes
```objc
// ❌ Old deprecated way (iOS 12 and below)
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

// ✅ New iOS 13+ way
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
```

### Dark Mode Preparation
```objc
// ❌ Static colors
self.view.backgroundColor = [UIColor flatBlueColor];

// ✅ Dynamic colors for Dark Mode
if (@available(iOS 13.0, *)) {
    self.view.backgroundColor = [UIColor colorWithLightModeColor:[UIColor flatBlueColor]
                                                   darkModeColor:[UIColor flatBlueDarkColor]];
} else {
    self.view.backgroundColor = [UIColor flatBlueColor];
}
```

## 🛠️ Advanced Usage

### Custom Gradient Directions
```objc
// Create custom gradient
NSArray *colors = @[[UIColor flatMintColor], [UIColor flatTealColor], [UIColor flatGreenColor]];
UIColor *customGradient = [UIColor colorWithGradientStyle:UIGradientStyleRadial
                                                withFrame:CGRectMake(0, 0, 200, 200)
                                                andColors:colors];
```

### Color Scheme Generation
```objc
// Generate color schemes for design consistency
NSArray *analogousScheme = [NSArray arrayOfColorsWithColorScheme:ColorSchemeAnalogous
                                                      usingColor:[UIColor flatPurpleColor]
                                                   withFlatScheme:YES];

NSArray *complementaryScheme = [NSArray arrayOfColorsWithColorScheme:ColorSchemeComplementary
                                                          usingColor:[UIColor flatOrangeColor]
                                                       withFlatScheme:YES];
```

## 🎨 Available Flat Colors

Chameleon provides 24 beautiful flat colors in both light and dark variants:

**Light Colors:**
- `flatRedColor`, `flatOrangeColor`, `flatYellowColor`, `flatGreenColor`
- `flatMintColor`, `flatTealColor`, `flatCyanColor`, `flatBlueColor`
- `flatIndigoColor`, `flatVioletColor`, `flatPurpleColor`, `flatMagentaColor`
- `flatBrownColor`, `flatTanColor`, `flatCoffeeColor`, `flatPowderBlueColor`
- `flatNavyBlueColor`, `flatBlackColor`, `flatMaroonColor`, `flatForestGreenColor`
- `flatGrayColor`, `flatLimeColor`, `flatPinkColor`, `flatWhiteColor`

**Dark Variants:** Add `Dark` suffix (e.g., `flatRedDarkColor`, `flatBlueDarkColor`)

## 📱 Example App

Check out the example project in the repository to see Chameleon in action with iOS 13+ features including Dark Mode support.

## 🤝 Contributing

We welcome contributions! Please feel free to submit a Pull Request. Make sure to:

1. Follow the existing code style
2. Add tests for new features
3. Update documentation accordingly
4. Test on both iOS 13+ light and dark modes

## 📄 License

Chameleon is available under the MIT license. See the LICENSE file for more info.

## 🙏 Acknowledgments

- Thanks to all contributors who have helped improve Chameleon
- Special thanks to the iOS community for feedback and feature requests

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/ChameleonSPM/issues)
- **Documentation**: This README and inline code documentation
- **Community**: Join the discussion in GitHub Discussions

---

**Made with ❤️ for the iOS community**

*Chameleon - Beautiful, flat colors for iOS 13+ with Dark Mode support*
```

2. **Status Bar Style mới:**
```objc
// iOS 13+ có thêm UIStatusBarStyleDarkContent
if (@available(iOS 13.0, *)) {
    return UIStatusBarStyleDarkContent; // Text màu tối
} else {
    return UIStatusBarStyleDefault;     // Fallback
}
```

3. **Dark Mode Support:**
```objc
// Tạo màu thích ứng với Dark/Light mode
UIColor *adaptiveColor = [UIColor colorWithLightModeColor:[UIColor flatBlueColor]
                                            darkModeColor:[UIColor flatBlueDarkColor]];
```

### 🔄 Cách chuyển đổi

1. **Update minimum deployment target** trong project settings lên iOS 13.0
2. **Thay thế** tất cả `UIApplication.setStatusBarStyle` bằng `preferredStatusBarStyle`
3. **Sử dụng** `colorWithLightModeColor:darkModeColor:` cho Dark Mode
4. **Test** ứng dụng ở cả Light và Dark mode

## Khắc phục sự cố

Nếu gặp lỗi "unexpectedly did not find the new dependency in the package graph", hãy thử:

1. **Clean Build Folder**: `Product` > `Clean Build Folder`
2. **Reset Package Caches**: `File` > `Packages` > `Reset Package Caches`
3. **Update to Latest Package Versions**: `File` > `Packages` > `Update to Latest Package Versions`
4. **Xóa Derived Data**: `~/Library/Developer/Xcode/DerivedData`
5. **Restart Xcode**

## Changelog

### Version 3.0.0 (iOS 13+ Update)
- ✅ **iOS 13+ Support**: Nâng minimum deployment target lên iOS 13.0
- 🌓 **Dark Mode**: Thêm `colorWithLightModeColor:darkModeColor:` cho dynamic colors
- 📊 **Status Bar**: Cập nhật hỗ trợ `UIStatusBarStyleDarkContent` cho iOS 13+
- ⚠️ **Breaking Changes**: 
  - Loại bỏ deprecated `UIApplication.setStatusBarStyle` 
  - Developers cần implement `preferredStatusBarStyle` trong View Controllers
- 🧹 **Code Cleanup**: Dọn dẹp code thừa và cập nhật APIs deprecated

### Version 1.0.0
- Hỗ trợ Swift Package Manager
- Tương thích với Swift 5.0+
- Cập nhật minimum deployment target lên iOS 12.0
- Tối ưu hóa module.modulemap cho SPM

## License

Chameleon được phát hành dưới giấy phép MIT. Xem [LICENSE](LICENSE) để biết thêm chi tiết.