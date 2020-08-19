import UIKit

extension UIColor {
    class func hex (string: String, alpha: CGFloat) -> UIColor {
        let hexString = string.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexString as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let red = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            return UIColor.white
        }
    }
}
