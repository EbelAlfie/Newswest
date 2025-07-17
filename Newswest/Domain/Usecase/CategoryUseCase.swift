protocol CategoryUseCase {
    func getNewsCategory() async throws
    
    func getTopHeadlines() async throws
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
    
    func getTopHeadlines() async throws {
        return try await repository.getTopHeadlines()
    }
}
