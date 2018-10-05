import UIKit

extension NSDirectionalEdgeInsets {
    static let identity = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
}

protocol EncapsulatingLayoutContainer {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: EncapsulatingLayoutContainer {}
extension UILayoutGuide: EncapsulatingLayoutContainer {}

extension EncapsulatingLayoutContainer {
    func encapsulateWithSystemSpacing(inside container: EncapsulatingLayoutContainer,
                                      multipliers: NSDirectionalEdgeInsets = .identity) {
        (self as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalToSystemSpacingAfter: container.leadingAnchor,
                                     multiplier: multipliers.leading),
            topAnchor.constraint(equalToSystemSpacingBelow: container.topAnchor,
                                 multiplier: multipliers.top),
            container.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor,
                                                multiplier: multipliers.trailing),
            container.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor,
                                              multiplier: multipliers.bottom)
            ])
    }

    func encapsulate(inside container: EncapsulatingLayoutContainer,
                     insets: NSDirectionalEdgeInsets = .zero) {
        (self as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: container.leadingAnchor,
                                     constant: insets.leading),
            container.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: insets.trailing),
            topAnchor.constraint(equalTo: container.topAnchor,
                                 constant: insets.top),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: insets.bottom)
            ])
    }
}
