struct TopHeadlineResponse {
    let status: String
    let totalResults: Int
    let articles: [ArticleResponse]
}

struct ArticleResponse {
    let source: SourceResponse
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct SourceResponse {
    let id: String
    let name: String
}
