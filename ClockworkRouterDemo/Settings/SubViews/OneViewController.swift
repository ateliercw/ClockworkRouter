import UIKit

class OneViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "One"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
