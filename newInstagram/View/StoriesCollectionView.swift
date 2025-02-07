import UIKit

class StoriesCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let collectionView: UICollectionView
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: 60, height: 60)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        
        super.init(frame: frame)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        collectionView.register(FirstStoryCell.self, forCellWithReuseIdentifier: "FirstStoryCell")
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstStoryCell", for: indexPath) as! FirstStoryCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
            return cell
        }
    }
    
    
}

class StoryCell: UICollectionViewCell {
    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(storyImageView)
        NSLayoutConstraint.activate([
            storyImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storyImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storyImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        storyImageView.image = UIImage(named: "ronaldo_avatar")
        
        storyImageView.layer.borderWidth = 2
        storyImageView.layer.borderColor = UIColor.orange.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FirstStoryCell: UICollectionViewCell {
    private let myAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("+", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.tintColor = .white
            button.backgroundColor = .blue
            button.layer.cornerRadius = 15
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(myAvatarImageView)
            addSubview(addButton)
            
            NSLayoutConstraint.activate([
                myAvatarImageView.topAnchor.constraint(equalTo: topAnchor),
                myAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                myAvatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                myAvatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                addButton.bottomAnchor.constraint(equalTo: myAvatarImageView.bottomAnchor, constant: -5),
                addButton.trailingAnchor.constraint(equalTo: myAvatarImageView.trailingAnchor, constant: -5),
                addButton.widthAnchor.constraint(equalToConstant: 20),
                addButton.heightAnchor.constraint(equalToConstant: 20)
            ])
            
        myAvatarImageView.image = UIImage(named: "your_avatar")
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
