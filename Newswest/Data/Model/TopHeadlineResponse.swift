struct TopHeadlineResponse: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleResponse?]
    
    func toDomain() -> TopHeadline {
        return TopHeadline(
            status: status.replaceIfNull(),
            totalResults: totalResults.replaceIfNull(),
            articles: articles.map { article in article.toDomain() }
        )
    }
}

struct ArticleResponse: Decodable {
    let source: SourceResponse
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    func toDomain() -> Article {
        return Article(
            id: source.id.replaceIfNull(),
            name: source.name.replaceIfNull(),
            author: author.replaceIfNull(),
            title: title.replaceIfNull(),
            description: description.replaceIfNull(),
            url: url.replaceIfNull(),
            urlToImage: urlToImage.replaceIfNull(),
            publishedAt: publishedAt.replaceIfNull(),
            content: content.replaceIfNull()
        )
    }
}

struct SourceResponse: Decodable {
    let id: String?
    let name: String?
}
