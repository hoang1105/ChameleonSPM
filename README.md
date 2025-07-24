# Chameleon Framework (Swift Package Manager)

<p align="center">
  <img src="http://i.imgur.com/BwqHhB4.png" alt="Chameleon by Vicc Alexander" width="400"/>
</p>

## Giới thiệu

**Chameleon** là một framework màu sắc mạnh mẽ, gọn nhẹ cho iOS, hỗ trợ cả Objective-C & Swift. Nó được xây dựng dựa trên ý tưởng rằng các ứng dụng phần mềm phải hoạt động một cách dễ dàng mà vẫn duy trì được giao diện đẹp mắt.

Phiên bản này đã được đóng gói lại để tương thích hoàn toàn với **Swift Package Manager**, giúp bạn tích hợp vào dự án Xcode một cách nhanh chóng và hiện đại.

## Yêu cầu

* iOS 9.0+
* Xcode 11+
* Swift 5+

## Cài đặt với Swift Package Manager

Bạn có thể thêm Chameleon vào dự án của mình trong Xcode một cách dễ dàng:

1.  Mở dự án của bạn trong Xcode.
2.  Đi tới **File** > **Swift Packages** > **Add Package Dependency...**
3.  Trong ô tìm kiếm, dán URL kho chứa Git của bạn (ví dụ: URL GitHub mà bạn đã tải mã nguồn này lên).
4.  Xcode sẽ tự động nhận diện package. Chọn phiên bản bạn muốn và nhấn **Next**.
5.  Chọn target của ứng dụng mà bạn muốn thêm thư viện này vào và nhấn **Finish**.

## Sử dụng

Để bắt đầu sử dụng, bạn chỉ cần import `Chameleon` vào tệp mã nguồn của mình.

**Swift:**

```swift
import ChameleonFramework

class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sử dụng một màu flat có sẵn
        view.backgroundColor = UIColor.flatMint
        
        // Hoặc tạo màu gradient
        view.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: [.flatRed, .flatBlue])
    }
}