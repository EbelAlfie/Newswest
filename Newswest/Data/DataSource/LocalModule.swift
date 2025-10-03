import CoreData

class LocalModule {
    
    func saveFavoriteNews(article: Article) {
        let context = NSPersistentContainer.init().viewContext
        if let newTask = NSEntityDescription.insertNewObject(forEntityName: "Article", into: context) as? Article {
            do {
                try context.save()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
