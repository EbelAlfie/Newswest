struct Provider {
    private let client = NetworkModule.init()
    
    func provideHomeVM() -> HomeViewModel {
        let repository = CategoryRepositoryImpl(client: client)
        let usecase = CategoryUseCaseImpl(repository: repository)
        return HomeViewModel(categoryUseCase: usecase)
    }
}
