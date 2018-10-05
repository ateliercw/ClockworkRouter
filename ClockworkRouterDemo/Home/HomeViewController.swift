import UIKit

class HomeViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Home"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
