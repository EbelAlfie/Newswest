import UIKit

class CategoryItem: UICollectionViewCell {
    
    private lazy var categoryLabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private func setupItems() {
        categoryLabel.text = "All News"
    }
}

extension CategoryItem {
    private func setupViews() {
        
    }
}
