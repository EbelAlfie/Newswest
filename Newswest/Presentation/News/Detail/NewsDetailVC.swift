import UIKit

class NewsDetailVC: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension NewsDetailVC {
    func setupViews() {
        view.addSubview(imageView)
        view.addSubview(headerText)
        view.addSubview(contentText)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerText.translatesAutoresizingMaskIntoConstraints = false
        contentText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
