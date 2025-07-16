import Foundation

class CategoryRepositoryImpl: CategoryRepository {
    private let client: URLSession
    
    init(urlSession: URLSession) {
        self.client = urlSession
    }
}

extension CategoryRepositoryImpl {
    func getNewsCategory() {
        
    }
    
    func getTopHeadlines() {
        do {
            guard let url = URL(string: APIConst.TOP_HEADLINES) else { return } //Throw ajaa
            let request = URLRequest(url: url)
            client.dataTask(with: <#T##URLRequest#>)
        } catch {
            
        }
    }
}
