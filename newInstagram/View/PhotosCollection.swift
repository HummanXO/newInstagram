import UIKit

class PhotosCollectionViewCell: UITableViewCell {
    let photosArray = ["elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk", "elonMusk"]
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 20) / 3, height: (UIScreen.main.bounds.width - 20) / 3)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.addSubview(collectionView)
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: "PhotosCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as! PhotosCell
        return cell
    }
}

class PhotosCell: UICollectionViewCell {
    let imgeView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imgeView.image = UIImage(named: "elonMusk")
        contentView.addSubview(imgeView)
        imgeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgeView.topAnchor.constraint(equalTo: topAnchor),
            imgeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imgeView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
