import UIKit

extension UIButton {
    convenience init(title: String, target: Any? = nil, selector: Selector? = nil) {
        self.init(type: .system)
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        self.setTitle(title, for: .normal)
        if let action = selector {
            self.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}
