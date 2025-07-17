protocol CategoryRepository {
    func getNewsCategory() async throws
    
    func getTopHeadlines() async throws
}
