import UIKit
import ClockworkRouter

class MainRouter: UITabBarController, Router {
    enum Target: Destination, CaseIterable {
        typealias Container = MainRouter
        static var presentFrom: BaseRouter.Target? = .main
        case home
        case settings
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let newViewControllers: [UIViewController] = Target.allCases.map { target in
            switch target {
            case .home: return HomeRouter()
            case .settings: return SettingsRouter()
            }
        }
        setViewControllers(newViewControllers, animated: false)
        selectedViewController = newViewControllers.first
    }

    func navigate(to destination: MainRouter.Target, animated: Bool, completion: ((UIResponder) -> Void)?) {
        guard let index = Target.allCases.index(of: destination) else { return }
        if selectedIndex == index {
            (selectedViewController as? UINavigationController)?.popToRootViewController(animated: animated)
        } else {
            selectedIndex = index
        }
        completion?(selectedViewController ?? self)
    }
}
