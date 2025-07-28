import UIKit

class CategoryItem: UICollectionViewCell {
    
    private let rootView = UIView()
    
    private lazy var categoryLabel = {
        let label = UILabel()
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 1.0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func bindData(_ label: String) {
        categoryLabel.text = label
    }
    
    func getLabel() -> String {
        return categoryLabel.text ?? "business"
    }
}

private extension CategoryItem {
    func setupViews() {
        contentView.addSubview(rootView)
        rootView.addSubview(categoryLabel)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        rootView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rootView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rootView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -10),
            categoryLabel.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10)
        ])
    }
}
