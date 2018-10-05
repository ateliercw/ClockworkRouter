import UIKit
import ClockworkRouter

class SettingsRouter: UINavigationController, Router {
    enum Target: Destination {
        typealias Container = SettingsRouter
        static var presentFrom: MainRouter.Target? = .settings

        case one
        case two
        case three

        case settings
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        self.setViewControllers([SettingsViewController()], animated: false)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func navigate(to destination: SettingsRouter.Target, animated: Bool, completion: ((UIResponder) -> Void)?) {
        switch destination {
        case .settings:
            defer { completion?(visibleViewController ?? self) }
            guard visibleViewController?.isKind(of: SettingsViewController.self) != true else { return }
            self.popToRootViewController(animated: true)
        case .one: push(OneViewController.init, animated: animated, completion: completion)
        case .two: push(TwoViewController.init, animated: animated, completion: completion)
        case .three: push(ThreeViewController.init, animated: animated, completion: completion)
        }
    }

    func push<Target: UIViewController>(_ provider: () -> Target,
                                        animated: Bool,
                                        completion: ((UIResponder) -> Void)?) {
        guard self.visibleViewController?.isKind(of: Target.self) != true else { return }
        self.popToRootViewController(animated: animated)
        let newViewController = provider()
        self.pushViewController(newViewController, animated: animated)
        if let coordinator = self.transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { [unowned self] _ in
                completion?(self.visibleViewController ?? self)
            }
        } else {
            completion?(visibleViewController ?? self)
        }
    }
}
