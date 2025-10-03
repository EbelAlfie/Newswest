protocol CategoryUseCase {
    func getNewsCategory() async throws
    
    func getTopHeadlines(_ category: String, _ completion: @escaping (Response<TopHeadline>) -> Void)
    
    func saveFavoriteNews(article: Article)
    
    func getFavoriteNews() -> [Article]
}

class CategoryUseCaseImpl: CategoryUseCase {
    private let repository: CategoryRepository
    
    init(repository: CategoryRepository) {
        self.repository = repository
    }
}

extension CategoryUseCaseImpl {
    func getNewsCategory() async throws {
        
    }
    
    func getTopHeadlines(_ category: String, _ completion: @escaping (Response<TopHeadline>) -> Void) {
        return repository.getTopHeadlines(category, completion)
    }
    
    func saveFavoriteNews(article: Article) {
        repository.saveFavoriteNews(article: article)
    }
    
    func getFavoriteNews() -> [Article] {
        return repository.getFavoriteNews()
    }
}
