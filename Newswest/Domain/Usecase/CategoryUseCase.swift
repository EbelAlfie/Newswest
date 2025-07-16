protocol CategoryUseCase {
    func getNewsCategory()
    
    func getTopHeadlines()
}

class CategoryUseCaseImpl: CategoryUseCase {
    private let repository: CategoryRepository
    
    init(repository: CategoryRepository) {
        self.repository = repository
    }
}

extension CategoryUseCaseImpl {
    func getNewsCategory() {
        
    }
    
    func getTopHeadlines() {
        
    }
}
