import UIKit

class NewsItem: UICollectionViewCell {
    private let rootView = UIView()
    
    private lazy var imageView = {
        let iv = UIImageView()
        iv.frame = CGRectMake(0, 0, 50, 50)
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
        bindImage(article.urlToImage)
        header.text = article.content
    }
    
    private func bindImage(_ url: String) {
        imageView.loadImage(url, CGSize(width: 100, height: 100))
    }
}

private extension NewsItem {
    func setupViews() {
        contentView.addSubview(rootView)
        
        rootView.addSubview(imageView)
        rootView.addSubview(header)
        
        rootView.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rootView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rootView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            setConstraint(imageView.topAnchor, rootView.topAnchor, 10),
            setConstraint(imageView.trailingAnchor, rootView.trailingAnchor, -10),
            setConstraint(imageView.leadingAnchor, rootView.leadingAnchor, 10),
            
            setConstraint(header.topAnchor, imageView.bottomAnchor, 10),
            setConstraint(header.trailingAnchor, rootView.trailingAnchor, -10),
            setConstraint(header.leadingAnchor, rootView.leadingAnchor, 10),
        ])
    }
    
    func setConstraint<anchorType>(_ from: NSLayoutAnchor<anchorType>,_ to: NSLayoutAnchor<anchorType>,_ margin: CGFloat = 0) -> NSLayoutConstraint {
        return from.constraint(equalTo: to, constant: margin)
    }
}
