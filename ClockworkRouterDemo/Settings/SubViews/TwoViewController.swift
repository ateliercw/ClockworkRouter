import UIKit

class TwoViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Two"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
