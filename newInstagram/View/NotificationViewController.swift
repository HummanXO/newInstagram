import UIKit

class NotificationViewController: UIViewController {
    
    let actionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 34, weight: .medium)
        label.textAlignment = .left
        label.text = "Actions"
        return label
    }()
    
    let friendRequestLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        label.text = "Friend Request"
        return label
    }()
    
    let refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .white
        return refresh
    }()
    
    @objc func handleRefresh() {
        _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            self.refresh.endRefreshing()
        })
    }
    
    let sections: [NotificationSection] = [
        NotificationSection(title: "Today", items: [
            NotificationItem(type: .comment, userName: "vtumxi", message: "упомянул(-а) вас в комментарии: @evgeny...", profileImage: "user1"),
            NotificationItem(type: .like, userName: "tima5959", message: "понравился ваш комментарий: 'Красивые кадры'", profileImage: "user2")
        ]),
        NotificationSection(title: "На этой неделе", items: [
            NotificationItem(type: .followRequest, userName: "zenkova2021", message: "есть в Instagram. Вы можете знать этого человека.", profileImage: "user3"),
            NotificationItem(type: .suggestedFriend, userName: "goncharov.se", message: "и pipko_katerina подписались на ivanprohorovich1962", profileImage: "user4")
        ])
    ]
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createTable()
        tableView.register(NotificationCell.self, forCellReuseIdentifier: "NotificationCell")
        tableView.refreshControl = refresh
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    private func createTable() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        [actionLabel, friendRequestLabel, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            actionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            actionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            friendRequestLabel.topAnchor.constraint(equalTo: actionLabel.bottomAnchor, constant: 10),
            friendRequestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: friendRequestLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
    
extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        let notificationItem = sections[indexPath.section].items[indexPath.row]
        cell.configure(with: notificationItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black

        let titleLabel = UILabel()
        titleLabel.text = sections[section].title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }
    
}
