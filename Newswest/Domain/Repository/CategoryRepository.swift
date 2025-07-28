protocol CategoryRepository {
    func getNewsCategory() async throws
    
    func getTopHeadlines(_ category: String, _ completion: @escaping (Response<TopHeadline>) -> Void)
}
