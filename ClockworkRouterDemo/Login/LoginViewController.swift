import UIKit

class LoginViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Login"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let button = UIButton(title: "Login", target: self, selector: #selector(login))
        let wrapper = UIScrollView()
        wrapper.addSubview(button)
        button.encapsulateWithSystemSpacing(inside: wrapper)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: wrapper.readableContentGuide.widthAnchor)
            ])
        view.addSubview(wrapper)
        wrapper.encapsulate(inside: view)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

private extension LoginViewController {
    @objc func login() {
        route(to: HomeRouter.Target.home)
    }
}
