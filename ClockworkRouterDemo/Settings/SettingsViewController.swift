import UIKit
import ClockworkRouter

class SettingsViewController: UITableViewController {
    init() {
        super.init(style: .plain)
        self.title = "Settings"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settings")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settings") else { fatalError() }
        let label: String
        switch self.sections[indexPath.section][indexPath.row] {
        case .logout: label = "Log out"
        }
        cell.textLabel?.text = label
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.sections[indexPath.section][indexPath.row] {
        case .logout: route(to: BaseRouter.Target.login)
        }
    }

    private let sections: [[Row]] = [[
        .logout
        ]]
    private enum Row {
        case logout
    }
}
