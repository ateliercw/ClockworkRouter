import Foundation

public class EmptyRouter: Router {
    public enum Target: Destination {
        public typealias Container = EmptyRouter
        public static var presentFrom: EmptyRouter.Target? { return nil }
    }

    public func navigate(to destination: EmptyRouter.Target,
                         animated: Bool,
                         completion: ((UIResponder) -> Void)?) {
        fatalError("It should be impossible to navigate to an empty router")
    }
}
