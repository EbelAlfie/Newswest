protocol CategoryRepository {
    func getNewsCategory() async throws
    
    func getTopHeadlines(completion: @escaping (Response<TopHeadline>) -> Void)
}
