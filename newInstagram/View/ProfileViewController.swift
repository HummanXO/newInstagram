import UIKit

class ProfileViewController: UIViewController {
    
    let data: [ProfileData] = [ProfileData(name: "elonmusk", imageName: "elonMusk")]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileDataCell.self, forCellReuseIdentifier: "ProfileDataCell")
        tableView.register(ActualTableCell.self, forCellReuseIdentifier: "ActualTableCell")
        tableView.register(PhotosCollectionViewCell.self, forCellReuseIdentifier: "PhotosCollectionViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar() {
        title = "elonmusk"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        let navbarAppearance = UINavigationBarAppearance()
        
        navbarAppearance.configureWithOpaqueBackground()
        navbarAppearance.backgroundColor = .black
        navbarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navbarAppearance.titleTextAttributes.updateValue(UIFont.systemFont(ofSize: 18, weight: .bold), forKey: .font)
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
        
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        let topSafeArea = view.safeAreaInsets.top
        let bottomSafeArea = view.safeAreaInsets.bottom
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return 100
        } else {
            let usedHeight = topSafeArea + bottomSafeArea + navigationBarHeight + 200 + 100
            let remainingHeight = screenHeight - usedHeight
            return max(remainingHeight, 200)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDataCell", for: indexPath) as! ProfileDataCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActualTableCell", for: indexPath) as! ActualTableCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
            return cell
        }
    }
}
