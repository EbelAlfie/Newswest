struct ViewModelProvider {
    private let useCaseProvider = UseCaseProvider()
    
    func provideHomeVM() -> HomeViewModel {
        let usecase = useCaseProvider.provideCategoryUseCase()
        return HomeViewModel(categoryUseCase: usecase)
    }
    
    func provideNewsDetailVM() -> NewsDetailViewModel {
        let usecase = useCaseProvider.provideCategoryUseCase()
        return NewsDetailViewModel(categoryUseCase: usecase)
    }
}

struct UseCaseProvider {
    private let client = NetworkModule.init()
    private let database = LocalModule()
    
    func provideCategoryUseCase() -> CategoryUseCase {
        let repository = CategoryRepositoryImpl(client: client, database: database)
        return CategoryUseCaseImpl(repository: repository)
    }
}
