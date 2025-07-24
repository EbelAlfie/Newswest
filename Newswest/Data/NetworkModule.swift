import Foundation

typealias CompletionHandler = @Sendable (Data?, URLResponse?, (any Error)?) -> Void

class NetworkModule {
    private lazy var urlSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let client = URLSession(configuration: configuration)
        return client
    }()
    
    func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionDataTask {
        let task = urlSession.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}
