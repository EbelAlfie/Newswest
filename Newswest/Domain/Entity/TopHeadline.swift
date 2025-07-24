struct TopHeadline {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article {
    let id: String
    let name: String
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}
