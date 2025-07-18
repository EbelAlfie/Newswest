import UIKit

class HomeVC: UIViewController {
    private let viewModel = AppDelegate.provider.provideHomeVM()
    
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
        let tab = UICollectionView()
        return tab
    }()

    private lazy var newsList = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        loadData()
    }
    
    private func loadData() {
        viewModel.getNews()
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
        ])
    }
    
    func setupNewsList() {
        newsList.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsList.topAnchor.constraint(equalTo: categoryTab.bottomAnchor),
            newsList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsList.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
