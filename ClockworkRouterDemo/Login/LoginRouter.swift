import UIKit

class LoginRouter: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = title
        setViewControllers([LoginViewController()], animated: false)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
