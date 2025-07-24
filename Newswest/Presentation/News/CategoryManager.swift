import UIKit

class CategoryManager: NSObject, UICollectionViewDataSource { //UICollectionViewDelegateFlowLayout
    private let newsItem: [String]
    
    init(items: [String]) {
        self.newsItem = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: <#T##IndexPath#>)
        if let categoryCell = cell as? CategoryItem, let item = newsItem.getOrNull(indexPath.item)  {
            categoryCell.bindData(item)
        }
        
        return cell
    }
}
