import Foundation

class NetworkModule {
    private lazy var urlSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let client = URLSession(configuration: configuration)
        return client
    }()
    
    func request(_ request: URLRequest) async -> URLSessionDataTask {
        let task = urlSession.dataTask(with: request)
        task.resume()
        return task
    }
}
