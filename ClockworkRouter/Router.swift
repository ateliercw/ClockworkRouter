import UIKit

public protocol Router: AnyObject {
    associatedtype Target: Destination where Target.Container == Self
    func navigate(to destination: Target, animated: Bool, completion: ((UIResponder) -> Void)?)
}

public extension UIResponder {
    public func route<Target: Destination>(to destination: Target,
                                           animated: Bool = true,
                                           completion: ((UIResponder) -> Void)? = nil) {
        if !performRoute(using: Target.Container.self, to: destination, animated: animated, completion: completion),
            let destination = Target.presentFrom {
            route(to: destination, animated: animated) { newResponder in
                newResponder.route(to: destination, animated: animated, completion: completion)
            }
        }
        _ = performRoute(using: Target.Container.self, to: destination, animated: animated, completion: completion)
    }

    private func performRoute<RouteHandler: Router>(using router: RouteHandler.Type,
                                                    to destination: RouteHandler.Target,
                                                    animated: Bool,
                                                    completion: ((UIResponder) -> Void)?) -> Bool {
        if let routeHandler = self as? RouteHandler {
            routeHandler.navigate(to: destination, animated: animated, completion: completion)
            return true
        } else if let next = next {
            return next.performRoute(using: router, to: destination, animated: animated, completion: completion)
        } else {
            return false
        }
    }
}
