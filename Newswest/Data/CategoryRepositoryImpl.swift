import Foundation

class CategoryRepositoryImpl: CategoryRepository {
    private let client: NetworkModule
    
    init(client: NetworkModule) {
        self.client = client
    }
}

extension CategoryRepositoryImpl {
    func getNewsCategory() {
        
    }
    
    func getTopHeadlines() async throws {
        do {
            Response<Void>.loading
            guard let url = URL(string: APIConst.TOP_HEADLINES) else { return } //Throw ajaa
            let request = URLRequest(url: url)
            let response = await client.request(request)
            Response.success(data: response)
        } catch {
            Response<Void>.error(error: error)
        }
    }
}
