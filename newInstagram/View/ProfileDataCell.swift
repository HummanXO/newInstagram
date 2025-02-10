import UIKit

class ProfileDataCell: UITableViewCell {
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    let imageStatsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 50
        return stackView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.image = UIImage(named: "elonMusk")
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.orange.cgColor
        return imageView
    }()
    
    let statsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    let postsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemGray6
        label.text = "100\nposts"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemGray6
        label.text = "100k\nfollowers"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemGray6
        label.text = "10k\nfollowing"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let nameDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.text = "Elon Musk"
        return label
    }()
    
    let jobLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.text = "Entrepreneur"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "CEO of Tesla, SpaceX, and Neuralink"
        return label
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Message", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.tintColor = .white
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(imageStatsStackView)
        imageStatsStackView.addArrangedSubview(profileImageView)
        imageStatsStackView.addArrangedSubview(statsStackView)
        
        statsStackView.addArrangedSubview(postsLabel)
        statsStackView.addArrangedSubview(followersLabel)
        statsStackView.addArrangedSubview(followingLabel)
        
        mainStackView.addArrangedSubview(nameDescriptionStackView)
        mainStackView.addArrangedSubview(buttonsStackView)
        
        nameDescriptionStackView.addArrangedSubview(nameLabel)
        nameDescriptionStackView.addArrangedSubview(jobLabel)
        nameDescriptionStackView.addArrangedSubview(descriptionLabel)
        
        buttonsStackView.addArrangedSubview(followButton)
        buttonsStackView.addArrangedSubview(messageButton)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
