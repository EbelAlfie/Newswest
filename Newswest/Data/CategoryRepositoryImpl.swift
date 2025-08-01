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
    
    func getTopHeadlines(_ category: String, _ completion: @escaping (Response<TopHeadline>) -> Void) {
        guard let url = URL(string: APIConst.TOP_HEADLINES)?.appending(queryItems: [
            URLQueryItem(name: "category", value: category)
        ]) else { return }
        
        let request = URLRequest(url: url)
        let _ = client.request(request) { data, _, error in
            do {
                if let result = data {
                    let res = try result.mapResponse(TopHeadlineResponse.self)
                    completion(Response<TopHeadline>.success(data: res.toDomain()))
                }
                
                if let errorResponse = error {
                    completion(Response<TopHeadline>.error(error: errorResponse))
                }
            } catch {
                completion(Response<TopHeadline>.error(error: error))
            }
        }
    }
}
