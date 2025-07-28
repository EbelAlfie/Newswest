import UIKit

class CategoryManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let newsItem: [String]
    
    private var reloadData: ((Int) -> Void)? = nil
    
    init(
        items: [String],
    ) {
        self.newsItem = items
    }
    
    func setListener(reloadData: @escaping (Int) -> Void) {
        self.reloadData = reloadData
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath)
        if let categoryCell = cell as? CategoryItem, let item = newsItem.getOrNull(indexPath.item)  {
            categoryCell.bindData(item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        reloadData?(indexPath.item)
    }
}
