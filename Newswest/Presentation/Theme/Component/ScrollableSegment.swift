import UIKit

class TabView: UIScrollView {
    private lazy var segment: UISegmentedControl = UISegmentedControl()
    
    func setItems(items: [Any]) {
        items.enumerated().forEach { (index, item) in
            segment.insertSegment(withTitle: "\(item)", at: index, animated: true)
        }
    }
    
    func setupViews(rootView: UIView) {
        addSubview(segment)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segment.leadingAnchor.constraint(equalTo: leadingAnchor),
            segment.trailingAnchor.constraint(equalTo: trailingAnchor),
            segment.topAnchor.constraint(equalTo: topAnchor),
            segment.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
