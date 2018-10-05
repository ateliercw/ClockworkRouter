import UIKit

class SettingsRouter: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        self.setViewControllers([SettingsViewController()], animated: false)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
