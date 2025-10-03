class NewsDetailViewModel {
    private let categoryUseCase: CategoryUseCase
    
    init(categoryUseCase: CategoryUseCase) {
        self.categoryUseCase = categoryUseCase
    }
    
    func saveFavoriteNews(article: Article) {
        categoryUseCase.saveFavoriteNews(article: article)
    }
}
