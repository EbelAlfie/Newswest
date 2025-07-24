import Foundation

class HomeViewModel {
    private let categoryUseCase: CategoryUseCase
    
    @Published var newsItem: TopHeadline? = nil
    
    init(categoryUseCase: CategoryUseCase) {
        self.categoryUseCase = categoryUseCase
    }
    
}

extension HomeViewModel {
    func getNews(
        category: String,
        onSuccess: @escaping (_ data: TopHeadline?) -> Void,
        onError: @escaping (_ error: Error) -> Void
    ) {
        categoryUseCase.getTopHeadlines { topHeadline in
            switch (topHeadline) {
            case .success(let headline):
                self.newsItem = headline
                onSuccess(headline)
                break
            case .error(let error):
                onError(error)
                break
            default :
                break
            }
        }
    }
}
