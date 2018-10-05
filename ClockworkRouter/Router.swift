import UIKit

public protocol Destination {
    associatedtype Container: Router where Container.Target == Self
}

public protocol ChildDestination: Destination {
    associatedtype Presenter: Destination
    static var presentFrom: Presenter { get }
}

public protocol GrandChildDestination: Destination {
    associatedtype Presenter: ChildDestination
    static var presentFrom: Presenter { get }
}

public protocol Router: AnyObject {
    associatedtype Target: Destination where Target.Container == Self
    func navigate(to destination: Target, animated: Bool, completion: ((UIResponder) -> Void)?)
}

public extension UIResponder {
    public func route<Target: Destination>(to destination: Target,
                                           animated: Bool = true,
                                           completion: ((UIResponder) -> Void)? = nil) {
        _ = performRoute(using: Target.Container.self, to: destination, animated: animated, completion: completion)
    }

    public func route<Target: ChildDestination>(to destination: Target,
                                                animated: Bool = true,
                                                completion: ((UIResponder) -> Void)? = nil) {
        if !performRoute(using: Target.Container.self, to: destination, animated: animated, completion: completion) {
            route(to: Target.presentFrom, animated: animated) { newResponder in
                newResponder.route(to: destination, animated: animated, completion: completion)
            }
        }
    }

    public func route<Target: GrandChildDestination>(to destination: Target,
                                                     animated: Bool = true,
                                                     completion: ((UIResponder) -> Void)? = nil) {
        if !performRoute(using: Target.Container.self, to: destination, animated: animated, completion: completion) {
            route(to: Target.presentFrom, animated: animated) { newResponder in
                newResponder.route(to: destination, animated: animated, completion: completion)
            }
        }
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
