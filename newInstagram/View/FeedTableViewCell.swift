import UIKit

class FeedTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: Post) {
        usernameLabel.text = model.name
        profileImageView.image = UIImage(named: model.avatarImage)
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    let moreOptionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let likedCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.text = "Нравиться: 192"
        label.textColor = .white
        label.textColor = .white
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let lookCommentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .gray
        label.text = "Посмотреть комментарии"
        return label
    }()
    
    let myProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "your_avatar")
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить комментарий..."
        textField.borderStyle = .none
        return textField
    }()
    
    let timestampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.text = "4 минуты назад"
        label.textColor = .gray
        return label
    }()
    
    
    
    public func setupUI() {
        [profileImageView, usernameLabel, moreOptionsButton, postImageView, likeButton, commentButton, directMessageButton, shareButton, likedCountLabel, descriptionLabel, lookCommentsLabel, myProfileImageView, commentTextField, timestampLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),

            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),

            moreOptionsButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            moreOptionsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 300),

            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10),

            directMessageButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            directMessageButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10),

            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            likedCountLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 10),
            likedCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            likedCountLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10),

            descriptionLabel.topAnchor.constraint(equalTo: likedCountLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            lookCommentsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            lookCommentsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lookCommentsLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10),

            myProfileImageView.topAnchor.constraint(equalTo: lookCommentsLabel.bottomAnchor, constant: 10),
            myProfileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            myProfileImageView.widthAnchor.constraint(equalToConstant: 30),
            myProfileImageView.heightAnchor.constraint(equalToConstant: 30),

            commentTextField.centerYAnchor.constraint(equalTo: myProfileImageView.centerYAnchor),
            commentTextField.leadingAnchor.constraint(equalTo: myProfileImageView.trailingAnchor, constant: 10),
            commentTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            timestampLabel.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: 10),
            timestampLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            timestampLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10),
            timestampLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
}
