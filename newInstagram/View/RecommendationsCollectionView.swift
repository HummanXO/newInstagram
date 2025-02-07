import UIKit



class RecommendationsCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 110, height: 210)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 10
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: "RecommendationCell")

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendationCell", for: indexPath) as! RecommendationCell
        return cell
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


import UIKit

class RecommendationCell: UICollectionViewCell {
    
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .darkGray
        iv.image = UIImage(named: "ronaldo_avatar")
        iv.layer.cornerRadius = 40
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "@Cristiano"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recommendForYouLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Recommended For You"
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Subscribe", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10 // ✅ Более скругленные углы
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 10
        contentView.addSubview(exitButton)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(recommendForYouLabel)
        contentView.addSubview(subscribeButton)
        
        NSLayoutConstraint.activate([
            // Exit Button
            exitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            exitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            // Image View (аватар)
            imageView.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 5),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            // Name Label
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            // Recommend For You Label
            recommendForYouLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            recommendForYouLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            recommendForYouLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            // Subscribe Button
            subscribeButton.topAnchor.constraint(equalTo: recommendForYouLabel.bottomAnchor, constant: 8),
            subscribeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subscribeButton.widthAnchor.constraint(equalToConstant: 100), // ✅ Сделал шире
            subscribeButton.heightAnchor.constraint(equalToConstant: 35), // ✅ Немного увеличил высоту
            
            // Bottom Constraint (чтобы контент не обрезался)
            subscribeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
