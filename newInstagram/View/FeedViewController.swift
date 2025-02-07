import UIKit

class FeedViewController: UIViewController {
    
    var tableView = UITableView()
    
    let identifier: String = "cell"
    
    var posts: [Post] = [
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
        Post(name: "cristiano", avatarImage: "ronaldo_avatar", image: "ronaldo_post", description: "Merry Christmas, everyone! 🎄"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        navigationBarSetup()
        tableView.dataSource = self
        tableView.delegate = self
        let storiesView = StoriesCollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        tableView.tableHeaderView = storiesView
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.register(RecommendationsTableViewCell.self, forCellReuseIdentifier: RecommendationsTableViewCell.identifier)
        
    }
    
    private func navigationBarSetup() {
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.tintColor = .white
        logoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .black
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
        
    }
    
    private func createTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = .black
        view.addSubview(tableView)
    }
    
}


extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + (posts.count / 2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 3 == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationsTableViewCell.identifier, for: indexPath) as! RecommendationsTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FeedTableViewCell
            let postIndex = indexPath.row - (indexPath.row / 3)
            cell.configure(with: posts[postIndex])
            return cell
        }
    }
    
    
}
