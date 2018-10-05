import Foundation

public protocol Destination {
    associatedtype ParentDestination: Destination
    associatedtype Container: Router where Container.Target == Self
    static var presentFrom: ParentDestination? { get }
}
