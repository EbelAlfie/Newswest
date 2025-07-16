import UIKit

class BaseColor {
    private let red: CGFloat
    private let green: CGFloat
    private let blue: CGFloat
    private let alpha: CGFloat
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    func asUIColor() -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    func asCGColor() -> CGColor {
        return CGColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
