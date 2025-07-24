# Chameleon Framework (Swift Package Manager Support)

<p align="center">
  <img src="http://i.imgur.com/BwqHhB4.png" alt="Chameleon by Vicc Alexander" width="400"/>
</p>

## Giới thiệu

**Chameleon** là một framework màu sắc mạnh mẽ, gọn nhẹ cho iOS, hỗ trợ cả Objective-C & Swift. Nó được xây dựng dựa trên ý tưởng rằng các ứng dụng phần mềm phải hoạt động một cách dễ dàng mà vẫn duy trì được giao diện đẹp mắt.

Phiên bản này đã được cập nhật để tương thích hoàn toàn với **Swift Package Manager** và **Swift 5+**.

## Yêu cầu

* iOS 13.0+
* Xcode 14+
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
import Chameleon
```

**Objective-C:**
```objc
#import <Chameleon/Chameleon.h>
```

> **Lưu ý**: Nếu bạn gặp vấn đề khi import `Chameleon`, hãy thử import `ChameleonSwift` thay thế trong Swift code. Điều này có thể xảy ra với một số phiên bản Xcode cụ thể.

### Ví dụ sử dụng

**Swift:**
```swift
import UIKit
import Chameleon

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sử dụng màu flat
        view.backgroundColor = UIColor.flatMint
        
        // Tạo màu bổ sung
        let complementaryColor = UIColor(complementaryFlatColorOf: UIColor.flatMint)
        
        // Tạo màu ngẫu nhiên
        let randomColor = UIColor.randomFlat
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
}

@end
```

**SwiftUI (iOS 13+):**
```swift
import SwiftUI
import Chameleon

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, Chameleon!")
                .foregroundColor(Color(UIColor.flatMint))
                .font(.title)
            
            Rectangle()
                .fill(Color(UIColor.randomFlat))
                .frame(width: 200, height: 100)
                .cornerRadius(10)
        }
        .background(Color(UIColor.flatWhite))
    }
}
```

## Tính năng chính

- **Flat Colors**: Hơn 24 màu flat được thiết kế đẹp mắt
- **Gradient Colors**: Tạo gradient với nhiều hướng khác nhau  
- **Color Schemes**: Tạo bảng màu tự động từ màu gốc
- **Contrasting Colors**: Tự động chọn màu tương phản phù hợp
- **Image Colors**: Trích xuất màu từ hình ảnh
- **iOS 13+ Compatible**: Tương thích hoàn toàn với iOS 13+ và các tính năng mới

## Tương thích iOS 13+

Framework này đã được kiểm tra và tương thích hoàn toàn với iOS 13+ bao gồm:

- ✅ **Dark Mode**: Hoạt động tốt với cả Light và Dark Mode
- ✅ **Scene Delegate**: Tương thích với Scene-based app lifecycle  
- ✅ **System Colors**: Có thể kết hợp với system colors mới
- ✅ **SwiftUI**: Có thể sử dụng trong SwiftUI projects
- ✅ **Catalyst**: Hỗ trợ Mac Catalyst apps

## Khắc phục sự cố

### Vấn đề Import Module

**Vấn đề**: Không thể import `Chameleon` trong Swift code
```swift
import Chameleon // Error: No such module 'Chameleon'
```

**Giải pháp**: Sử dụng `ChameleonSwift` thay thế:
```swift
import ChameleonSwift
```

Điều này xảy ra do cách Swift Package Manager xử lý mixed-language modules. Cả hai cách import đều cho kết quả giống nhau.

### Các lỗi khác

Nếu gặp lỗi "unexpectedly did not find the new dependency in the package graph", hãy thử:

1. **Clean Build Folder**: `Product` > `Clean Build Folder`
2. **Reset Package Caches**: `File` > `Packages` > `Reset Package Caches`
3. **Update to Latest Package Versions**: `File` > `Packages` > `Update to Latest Package Versions`
4. **Xóa Derived Data**: `~/Library/Developer/Xcode/DerivedData`
5. **Restart Xcode**

## Changelog

### Version 1.1.1
- Khắc phục vấn đề import module trong Swift Package Manager
- Thêm hướng dẫn sử dụng `ChameleonSwift` thay thế `Chameleon` nếu cần
- Cải thiện cấu hình module mapping

### Version 1.1.0
- Cập nhật hỗ trợ iOS 13.0+
- Tương thích với Dark Mode và Scene Delegate
- Tối ưu hóa cho Xcode 14+
- Cải thiện tương thích SwiftUI

### Version 1.0.0
- Hỗ trợ Swift Package Manager
- Tương thích với Swift 5.0+
- Cập nhật minimum deployment target lên iOS 12.0
- Tối ưu hóa module.modulemap cho SPM

## License

Chameleon được phát hành dưới giấy phép MIT. Xem [LICENSE](LICENSE) để biết thêm chi tiết.