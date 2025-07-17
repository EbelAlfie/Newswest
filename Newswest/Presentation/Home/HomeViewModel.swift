import Foundation

class HomeViewModel {
    private let categoryUseCase: CategoryUseCase
    
    @Published var newsItem: Bool = true
    
    init(categoryUseCase: CategoryUseCase) {
        self.categoryUseCase = categoryUseCase
    }
    
}

extension HomeViewModel {
    func getNews() {
        Task {
//            try await categoryUseCase.getTopHeadlines()
        }
    }
}
