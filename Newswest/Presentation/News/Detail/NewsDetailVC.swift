import UIKit

class NewsDetailVC: UIViewController {
    let article: Article?
    
    private let scrollview = {
        let scrollview = UIScrollView()
        return scrollview
    }()

    private let imageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let headerText = {
        let label = UILabel()
        label.font = label.font.withSize(30)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let contentText = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = []
        textView.textContainer.lineBreakMode = .byWordWrapping
        return textView
    }()
    
    private let authorText = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        return label
    }()
    
    private let favoriteButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemPink
        return button
    }()
    
    private let newsContentView = UIView()
    
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
        imageView.clipsToBounds = true
        imageView.loadImage(article?.urlToImage)
        headerText.text = article?.title
        contentText.attributedText = NSAttributedString(string: article?.content ?? "")
        authorText.text = "\(article?.author ?? "") \(article?.publishedAt ?? "")"
    }
}

private extension NewsDetailVC {
    func setupViews() {
        view.addSubview(scrollview)
        
        scrollview.addSubview(newsContentView)

        newsContentView.addSubview(imageView)
        newsContentView.addSubview(headerText)
        newsContentView.addSubview(contentText)
        newsContentView.addSubview(authorText)
        newsContentView.addSubview(favoriteButton)
        
        newsContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        authorText.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
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
            
            newsContentView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            newsContentView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            newsContentView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            newsContentView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            newsContentView.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: newsContentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            favoriteButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            favoriteButton.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            headerText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            headerText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            authorText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 5),
            authorText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            contentText.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: 10),
            contentText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contentText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contentText.bottomAnchor.constraint(equalTo: newsContentView.bottomAnchor),
        ])
    }
}
