import UIKit
import ClockworkRouter

class BaseRouter: UIViewController, Router {
    enum Target: Destination {
        typealias Container = BaseRouter
        case login
        case main
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .white
    }

    func navigate(to destination: BaseRouter.Target, animated: Bool, completion: ((UIResponder) -> Void)?) {
        let target: AnyClass
        switch destination {
        case .main: target = MainRouter.self
        case .login: target = LoginRouter.self
        }
        guard presentedViewController?.isKind(of: target) != true else { return }
        if let snapshot = presentedViewController?.view.snapshotView(afterScreenUpdates: true) {
            self.view.addSubview(snapshot)
            let finalize = present(destination, animated: animated) { responder in
                snapshot.removeFromSuperview()
                completion?(responder)
            }
            dismiss(animated: false, completion: finalize)
        } else {
            present(destination, animated: animated, completion: completion)()
        }
    }

    private func present(_ destination: BaseRouter.Target,
                         animated: Bool,
                         completion: ((UIResponder) -> Void)?) -> (() -> Void) {
        return { [unowned self] in
            let newViewController: UIViewController
            switch destination {
            case .main: newViewController = MainRouter()
            case .login: newViewController = LoginRouter()
            }
            self.present(newViewController, animated: animated) {
                completion?(newViewController)
            }
        }
    }
}
