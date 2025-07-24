import UIKit

// Extension để thêm phương thức tiện ích cho Swift
extension UIColor {
    public static func contrastColor(of backgroundColor: UIColor, returnFlat: Bool) -> UIColor {
        return colorWithContrastingBlackOrWhiteColor(on: backgroundColor, isFlat: returnFlat)
    }
    
    public static func contrastColor(of backgroundColor: UIColor, returnFlat: Bool, alpha: CGFloat) -> UIColor {
        return colorWithContrastingBlackOrWhiteColor(on: backgroundColor, isFlat: returnFlat, alpha: alpha)
    }
}

// Usage:
// cell.textLabel?.textColor = UIColor.contrastColor(of: cell.backgroundColor!, returnFlat: true)
