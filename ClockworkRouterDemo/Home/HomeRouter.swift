import UIKit
import ClockworkRouter

class HomeRouter: UINavigationController, Router {
    enum Target: Destination {
        typealias Container = HomeRouter
        case home

        static let presentFrom: MainRouter.Target? = .home
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        viewControllers = [HomeViewController()]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func navigate(to destination: HomeRouter.Target, animated: Bool, completion: ((UIResponder) -> Void)?) {
        guard topViewController?.isKind(of: HomeViewController.self) != true else {
            return
        }
        setViewControllers([HomeViewController()], animated: animated)
    }
}
