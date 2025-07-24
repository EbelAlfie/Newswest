protocol CategoryUseCase {
    func getNewsCategory() async throws
    
    func getTopHeadlines(completion: @escaping (Response<TopHeadline>) -> Void)
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
    
    func getTopHeadlines(completion: @escaping (Response<TopHeadline>) -> Void) {
        return repository.getTopHeadlines(completion: completion)
    }
}
