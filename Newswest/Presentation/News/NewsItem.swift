import UIKit

class NewsItem: UICollectionViewCell {
    private let rootView = UIView()
    
    private lazy var imageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var header = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func bindData(article: Article) {
        
    }
}

private extension NewsItem {
    func setupViews() {
        
    }
}
