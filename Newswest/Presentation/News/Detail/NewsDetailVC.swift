import UIKit

class NewsDetailVC: UIViewController {
    let article: Article?
    
    private let scrollview = {
        let scrollview = UIScrollView()
        return scrollview
    }()
    
    private let imageView = UIImageView()
    
    private let headerText = {
        let label = UILabel()
        label.font = label.font.withSize(40)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let contentText = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.article = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupData()
    }
    
    private func setupData() {
        imageView.contentMode = .scaleAspectFill
        imageView.loadImage(article?.urlToImage)
        headerText.text = article?.title
        contentText.text = article?.content
    }
}

private extension NewsDetailVC {
    func setupViews() {
        view.addSubview(scrollview)
        scrollview.addSubview(imageView)
        scrollview.addSubview(headerText)
        scrollview.addSubview(contentText)
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerText.translatesAutoresizingMaskIntoConstraints = false
        contentText.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: view.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            headerText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            headerText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            contentText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 10),
            contentText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contentText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
