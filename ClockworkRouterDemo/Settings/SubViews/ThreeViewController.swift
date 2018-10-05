import UIKit

class ThreeViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Three"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
