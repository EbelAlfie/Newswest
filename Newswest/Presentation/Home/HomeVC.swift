import UIKit

class HomeVC: UIViewController {
    private let viewModel = AppDelegate.provider.provideHomeVM()

    private let categoryManager = CategoryManager(items: newsCategory)
    
    private lazy var headerText = {
        let label = UILabel()
        label.text = "NewsWest"
        label.textColor = .white
        return label
    }()
    
    private lazy var backgroundCard = {
        let background = UIView()
        background.backgroundColor = .blue
        background.layer.cornerRadius = 20
        return background
    }()
    
    private var greetingText = {
        let label = UILabel()
        label.text = "Discover Trending and Latest News"
        label.font = label.font.withSize(30)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var categoryTab = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let tab = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tab.register(CategoryItem.self, forCellWithReuseIdentifier: "category")
        tab.dataSource = categoryManager
        
        return tab
    }()

    private lazy var newsList = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NewsItem.self, forCellWithReuseIdentifier: "news")
        collectionView.dataSource = self
        collectionView.delegate = self
        categoryManager.setListener(reloadData: loadData(_:))
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        loadData(0)
    }
    
    private func loadData(_ position: Int) {
        guard let category = newsCategory.getOrNull(position) else { return }
        viewModel.getNews(
            category: category,
            onSuccess: { data in
                DispatchQueue.main.async {
                    self.newsList.reloadData()
                }
            },
            onError: { error in
                
            }
        )
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.bounds.width
            let spacing: CGFloat = 10
            let insets: CGFloat = 10 * 2
            let numberOfColumns: CGFloat = 2

            let totalSpacing = insets + (numberOfColumns - 1) * spacing
            let width = (screenWidth - totalSpacing) / numberOfColumns

            return CGSize(width: width, height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedArticle = viewModel.newsItem?.articles.getOrNull(indexPath.item) else { return }
        
        let newsDetail = NewsDetailVC(article: selectedArticle)
        navigationController?.pushViewController(newsDetail, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.newsItem?.articles.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "news", for: indexPath)
        if let newsItem = cell as? NewsItem, let article = viewModel.newsItem?.articles.getOrNull(indexPath.item) {
            newsItem.bindData(article: article)
        }
        return cell
    }
}

private extension HomeVC {
    func setupViews() {
        backgroundCard.addSubview(greetingText)
        backgroundCard.addSubview(headerText)
        view.addSubview(backgroundCard)
        
        view.addSubview(categoryTab)
        view.addSubview(newsList)

        setupBackground()
        setupHeader()
        setupGreetingText()
        setupCategoryTab()
        setupNewsList()
    }
    
    func setupBackground() {
        backgroundCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundCard.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundCard.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundCard.bottomAnchor.constraint(equalTo: greetingText.bottomAnchor, constant: 50),
        ])
    }
    
    func setupHeader() {
        headerText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerText.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 20)
        ])
    }
    
    func setupGreetingText() {
        greetingText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greetingText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 10),
            greetingText.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 20),
            greetingText.trailingAnchor.constraint(equalTo: backgroundCard.trailingAnchor, constant: -20)
        ])
    }
    
    func setupCategoryTab() {
        categoryTab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryTab.topAnchor.constraint(equalTo: backgroundCard.bottomAnchor, constant: 10),
            categoryTab.widthAnchor.constraint(equalTo: view.widthAnchor),
            categoryTab.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupNewsList() {
        newsList.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsList.topAnchor.constraint(equalTo: categoryTab.bottomAnchor),
            newsList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
