# Chameleon Framework (Swift Package Manager Support)

<p align="center">
  <img src="http://i.imgur.com/BwqHhB4.png" alt="Chameleon by Vicc Alexander" width="400"/>
</p>

## Giới thiệu

**Chameleon** là một framework màu sắc mạnh mẽ, gọn nhẹ cho iOS, hỗ trợ cả Objective-C & Swift. Nó được xây dựng dựa trên ý tưởng rằng các ứng dụng phần mềm phải hoạt động một cách dễ dàng mà vẫn duy trì được giao diện đẹp mắt.

Phiên bản này đã được cập nhật để tương thích hoàn toàn với **Swift Package Manager** và **Swift 5+**.

## Yêu cầu

* iOS 13.0+
* Xcode 12+  
* Swift 5.0+

## Cài đặt với Swift Package Manager

### Cách 1: Thông qua Xcode (Khuyến nghị)

1. Mở dự án của bạn trong Xcode
2. Đi tới **File** > **Add Package Dependencies...**
3. Nhập URL repository: `https://github.com/hoang1105/ChameleonSPM.git`
4. Chọn phiên bản phù hợp và nhấn **Add Package**
5. Chọn target của ứng dụng và nhấn **Add Package**

### Cách 2: Thông qua Package.swift

Thêm dependency vào file `Package.swift` của bạn:

```swift
dependencies: [
    .package(url: "https://github.com/hoang1105/ChameleonSPM.git", .upToNextMajor(from: "1.0.0"))
]
```

## Sử dụng

### Import Framework

**Swift:**
```swift
import ChameleonSwift
```

**Objective-C:**
```objc
#import <Chameleon/Chameleon.h>
```

### Ví dụ sử dụng

**Swift:**
```swift
import UIKit
import ChameleonSwift

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sử dụng màu flat
        view.backgroundColor = UIColor.flatMint
        
        // Tạo màu bổ sung
        let complementaryColor = UIColor(complementaryFlatColorOf: UIColor.flatMint)
        
        // Tạo màu ngẫu nhiên
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
// Light colors
UIColor *lightBlue = [UIColor flatBlueColor];
UIColor *lightGreen = [UIColor flatGreenColor];

// Dark colors  
UIColor *darkBlue = [UIColor flatBlueDarkColor];
UIColor *darkGreen = [UIColor flatGreenDarkColor];
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
// ❌ Deprecated - Không hoạt động trên iOS 13+
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

// ✅ Cách mới - Implement trong View Controller  
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
[self setNeedsStatusBarAppearanceUpdate];
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