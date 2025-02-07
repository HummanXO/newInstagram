import UIKit

class RecommendationsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "RecommendationsTableViewCell"
    }
    
    private let recomendForYouLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .left
        label.text = "Recommendations for you"
        return label
    }()
    
    private let seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitle("See all", for: .normal)
        return button
    }()
    
    let recommendationsView = RecommendationsCollectionView()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
        
        [recomendForYouLabel, seeAllButton, recommendationsView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            recomendForYouLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            recomendForYouLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            seeAllButton.centerYAnchor.constraint(equalTo: recomendForYouLabel.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            recommendationsView.topAnchor.constraint(equalTo: recomendForYouLabel.bottomAnchor, constant: 10),
            recommendationsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recommendationsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recommendationsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            recommendationsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
