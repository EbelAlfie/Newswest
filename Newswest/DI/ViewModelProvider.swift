struct ViewModelProvider {
    private let useCaseProvider = UseCaseProvider()
    
    func provideHomeVM() -> HomeViewModel {
        let usecase = useCaseProvider.provideCategoryUseCase()
        return HomeViewModel(categoryUseCase: usecase)
    }
}

struct UseCaseProvider {
    private let client = NetworkModule.init()
    
    func provideCategoryUseCase() -> CategoryUseCase {
        let repository = CategoryRepositoryImpl(client: client)
        return CategoryUseCaseImpl(repository: repository)
    }
}
